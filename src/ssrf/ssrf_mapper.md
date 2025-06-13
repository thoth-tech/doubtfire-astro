# SSRF Testing Script - Methodologies and Evolution Report

## Overview

This documentation describes the methodology used in the script and how it evolved over the project.

Server-Side Request Forgery (SSRF) occurs when an attacker manipulates a server-side application to send HTTP requests to an unexpected destination. This can allow attackers to:

- Access internal services (such as localhost-only APIs and cloud metadata services like AWS `169.254.169.254`).
- Bypass firewalls.
- List internal networks.
- Potentially lead to other vulnerabilities, such as Remote Code Execution (RCE).

### Example SSRF Attack Scenarios

- Using `http://localhost/admin` in a URL field designed for external content.
- Redirecting internal service calls to sensitive cloud destinations, such as `http://169.254.169.254/latest/meta-data/`.

OnTrack relies on external API calls and webhooks, so SSRF was deemed a critical risk that required thorough audits.

## Test Cases

| Test                             | Description                                                              | Payload Examples                                                   |
| -------------------------------- | ------------------------------------------------------------------------ | ------------------------------------------------------------------ |
| **URL Injection**                | Inject internal addresses into parameters like URL, redirect, callback   | `http://127.0.0.1:80`, `http://169.254.169.254/latest/meta-data/`  |
| **Header Manipulation**          | Add custom headers like Host or X-Forwarded-For to bypass filters        | `X-Forwarded-For: 127.0.0.1`                                       |
| **Large File Response Handling** | Force application to download large payloads to test resource exhaustion | Large local files (e.g., `/var/log/secure`)                        |
| **Timeout/Slow Server Testing**  | Test application behavior when internal services do not respond quickly  | Connection to closed or filtered internal ports                    |
| **TCP Port Probing (Optional)**  | Scan for open TCP services via non-standard payloads                     | Redis (`redis://127.0.0.1:6379`), MySQL (`mysql://127.0.0.1:3306`) |

## Methodologies Used

### Tools Required

- `Bash` / Linux Shell
- `cURL` (HTTP request tool)
- `jq` (For encoding payloads) from [jq GitHub Releases](https://github.com/stedolan/jq/releases)
- `grep` (response keyword matching)
- Burp Suite Community Edition (HTTP proxy and repeater)
- Docker (local environment setup for OnTrack)

### How to Run

1. **Set up the testing environment:**

   - Start an instance of OnTrack. Doubtfire-web : Branch 8.0.x, Doubtfire-API Branch: Default, Doubtfire-deploy Branch: 9.x
   - Install Burp Suite Community and configure it as the system proxy.
   - Install `jq` from [jq GitHub Releases](https://github.com/stedolan/jq/releases).

2. **Script Execution:**

   - Run the provided Bash script: `./ssrf_mapper.sh`.
   - Input the target base URL, port, API endpoints wordlist, SSRF payloads wordlist, and max timeout (in seconds) when prompted.
   - Select the HTTP method (`GET` or `POST`).
   - Logs are saved as:
     - Test Results: `ssrf_logs/ssrf_test_results_<timestamp>.md`
     - Timeouts: `ssrf_logs/slow_endpoints_<timestamp>.md`

3. **Monitor the output:**

   - The script logs all tests to `ssrf_test_results.txt`.
   - Watch for flagged entries marked as `[!] Possible SSRF Detected`.
   - Suspicious HTTP status codes or unusual response contents (like metadata or internal IPs) are indicators.

4. **Manual Follow-Up with Burp Suite:**
   - Review flagged URLs manually.
   - Replay suspicious requests with different payloads to confirm behavior.

### Understanding the Results

- **Normal Behavior:**
  - Proper validation errors or `403/404` statuses.
- **Potential SSRF:**
  - Successful `HTTP 200` responses from internal IPs or cloud metadata servers.
- **Critical SSRF:**
  - The server returns sensitive metadata (e.g., IAM roles, local configuration files).

## Script Design

### Key Methodologies

1. **Parameter Fuzzing**

   - The script iteratively tests various HTTP request parameters (e.g., URL, redirect, callback) that could potentially trigger server-side requests.
   - Common SSRF payloads were injected into parameters to identify any unvalidated server-side HTTP requests.

2. **Use of Controlled Payloads**

   - Payloads included known SSRF test strings such as:
     - `http://127.0.0.1`
     - `http://169.254.169.254` (AWS metadata IP)
     - Internal IPs and localhost addresses
   - Safe payloads were prioritized to avoid causing disruptions to production systems.
   - Additional payloads were gotten from `[h0tak88r](https://github.com/h0tak88r/Wordlists/blob/master/vulns/ssrf.txt)`

3. **HTTP Request Automation**

   - `curl` was used as the primary tool for sending HTTP requests.
   - Custom headers (e.g., Host, X-Forwarded-For) were optionally inserted to bypass certain filters.

4. **Response Analysis**

   - The script analyzed response bodies and headers to detect signs of successful server-side requests:
     - Status codes (e.g., `200 OK`, `302 Found`)
     - Keywords in response body (e.g., EC2, metadata, or internal server banners)
   - Any suspicious or unexpected response was flagged for manual review.

5. **Logging and Reporting**
   - Outputs of each test case were logged to a file for later review.
   - Clear indicators were included (e.g., "POTENTIAL SSRF DETECTED") for any anomalies.

## Script Evolution

| Phase                | Changes Introduced                                                                                                                                                                                 | Reason                                     |
| -------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------ |
| **Initial Version**  | Simple `curl` requests manually changed per endpoint                                                                                                                                               | Manual testing was slow and prone to error |
| **Second Iteration** | Added looping over multiple parameters automatically                                                                                                                                               | Increased coverage without manual edits    |
| **Third Iteration**  | Introduced multiple payloads and automated response logging                                                                                                                                        | Improved detection reliability             |
| **Fourth Iteration** | Added header manipulation and payload obfuscation attempts                                                                                                                                         | Simulated more advanced attacker behavior  |
| **Fifth Version**    | Implemented detailed output logging and basic concurrency (background requests)                                                                                                                    | Enhanced efficiency and audit traceability |
| **Final Version**    | Added checks for required tools and user inputs, `--max-time` attribute to requests, compatibility with wordlists. Results are now saved in `.md` format in seperate files and colored in terminal | Enhanced efficiency and audit traceability |

## Results from Testing

### Findings

- No critical SSRF vulnerabilities were confirmed in the initial public-facing endpoints.
- Some endpoints (`/api/proxy`, `/api/webhook`) accepted user-controlled URLs but properly validated external IPs and domains.
- No open internal services (like Redis, MySQL) were accessible via SSRF vectors.
- Burp Suite Repeater manual tests confirmed no blind SSRF behaviors (e.g., no out-of-band HTTP requests to internal services).

## Actions Required Following Investigations

### Short-term

- Implement strict allow-lists for URL validation where necessary (only specified trustworthy domains are permitted).
- Introduce connection timeouts for all server-side HTTP requests to prevent resource exhaustion attacks.

### Medium-term

- Integrate SSRF automated tests into CI/CD pipelines using the Bash script or adapted frameworks.
- Add explicit logging for any blocked outbound requests originating from server-side functions.

### Long-term

- Conduct regular penetration tests during major releases, including new SSRF payload updates.
