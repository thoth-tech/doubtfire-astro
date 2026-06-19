# Cryptographic Security Audit Script

## 1. Introduction

This Bash script performs a cryptographic security audit for web applications. It is compatible with macOS and Linux, and evaluates three key areas:

1. Encryption usage and key management
2. SSL/TLS configuration and certificate validation
3. Plaintext sensitive data exposure

The results are saved to a log file and also shown in the terminal with clear pass/warn/fail indicators.

---

## 2. Prerequisites

Before using this script, make sure the following tools are installed on your system.

### Required Tools

These are necessary for the script to run:

- `curl`
- `openssl`
- `grep`
- `awk`
- `sed`

### Optional Tools

These enhance scanning and coverage but are not mandatory:

- `nmap`
- `nc` (Netcat)
- `testssl.sh`
- `timeout` (Linux) or `gtimeout` (macOS via coreutils)

### macOS Installation Example

```bash
brew install curl openssl coreutils grep gnu-sed nmap
git clone https://github.com/drwetter/testssl.sh.git
```

> Note: `gtimeout` is installed with `coreutils` on macOS.

### Ubuntu/Debian Installation Example

```bash
sudo apt-get install curl openssl coreutils grep sed nmap
```

---

## 3. Usage

Make the script executable:

```bash
chmod +x crypto_audit.sh
```

Run the script with the required target options:

```bash
./crypto_audit.sh -u <TARGET_URL> -h <TARGET_HOST> -p <PORT>
```

### Example Usage

```bash
# Audit a live HTTPS application
./crypto_audit.sh -u https://example.com -h example.com -p 443

# Audit a local development app (non-HTTPS)
./crypto_audit.sh -u http://localhost:4200 -h localhost -p 4200
```

---

## 4. Test Descriptions

### 4.1 Encryption and Key Management

- Searches for AES-256 usage in common source files
- Checks for usage of cryptographic libraries and patterns
- Looks for hardcoded secrets (e.g., API keys, tokens, passwords)
- Inspects HTTP headers for `Strict-Transport-Security`, `Content-Security-Policy`, and similar

### 4.2 SSL/TLS Configuration

- Validates support for modern TLS versions (1.2 and 1.3)
- Flags support for outdated protocols (SSLv3, TLS 1.0, TLS 1.1)
- Checks available cipher suites and identifies strong or weak ciphers
- Attempts to retrieve and validate certificate metadata

### 4.3 Plaintext Sensitive Data Detection

- Scans log files and directories like `/var/log`, `tmp`, and `logs` for sensitive data patterns
- Examines source code for plaintext credentials
- Checks config files such as `.env`, `database.yml`, and `application.properties` for embedded secrets

---

## 5. Output and Logs

The script saves all outputs to a local directory:

- **Log folder:** `./crypto_audit_logs/`
- **Main result file:** `crypto_audit_results.txt`
- **Other logs:** HTTP headers, TLS ciphers, certificate info

A summary of PASS, WARN, and FAIL outcomes is printed at the end of the run.

---

## 6. Help and Options

To view available command-line options:

```bash
./crypto_audit.sh --help
```

### Available Options

| Option         | Description                          |
|----------------|--------------------------------------|
| `-u, --url`    | Target URL (e.g., `https://example.com`) |
| `-h, --host`   | Target hostname for TLS tests        |
| `-p, --port`   | Target port (default: `443`)         |
| `--help`       | Show help message                    |

---

## 7. Notes

- This script is intended for internal auditing use only.
- Do **not** run against systems you do not own or have permission to test.
- HTTPS is recommended for full functionality (especially for TLS and certificate checks).
- The script includes fallback logic for HTTP (such as when testing `localhost` on port 4200).

---

## 8. Recommendations After Audit

If the script reports any warnings or failures:

1. **Remove hardcoded secrets** from source code and config files.
2. **Use HTTPS with strong TLS protocols** only (TLS 1.2 or 1.3).
3. **Disable old/insecure protocols** like SSLv3, TLS 1.0, and TLS 1.1.
4. **Implement security headers** such as:
   - `Strict-Transport-Security`
   - `Content-Security-Policy`
   - `X-Frame-Options`
5. **Rotate any exposed tokens or credentials** immediately.

---

