---
title: End of Trimester Report
description: Final summary report submitted by AppAttack team.
---

# 📘 End of Trimester Security Report

This report has been submitted by the AppAttack team as part of the final deliverables for the OnTrack security assessment.

## 📄 Report Link

[Download Report](./AppAttack%20x%20Thoth%20Tech%20(EOT%20Report)%20(1).pdf)

> Submitted on time as per the agreed schedule.

---

## 🧭 Guidance for Future Security Contributors

To ensure continuity and avoid duplication, the following table provides a quick reference of vulnerabilities already addressed during the AppAttack x OnTrack collaboration. Future contributors should **not rework** these fixes unless new risks are identified.

| Vulnerability Name                                                   | Impact Level  | PR Link     |
| -------------------------------------------------------------------- | ------------- | ----------- |
| Clickjacking                                                         | Severe        | https://github.com/thoth-tech/doubtfire-deploy/pull/28 https://github.com/thoth-tech/doubtfire-web/pull/321 https://github.com/thoth-tech/documentation/pull/593 |
| Insecure Direct Object Reference (IDOR)                              | Major         | https://github.com/thoth-tech/documentation/pull/598 https://github.com/thoth-tech/doubtfire-api/pull/63 |
| Malicious Code Execution                                             | Major         | https://github.com/thoth-tech/doubtfire-astro/pull/35 https://github.com/thoth-tech/doubtfire-astro/pull/35 https://github.com/thoth-tech/doubtfire-web/pull/333 |
| Exposed JavaScript Source Maps _(False Positive)_                    | Major         | https://github.com/thoth-tech/doubtfire-astro/pull/37/commits https://github.com/thoth-tech/documentation/pull/596 |
| Session Hijacking and Fixation                                       | Significant   | https://github.com/thoth-tech/doubtfire-api/pull/61 |
| Token Exposure via Local Storage and HTTP Headers _(False Positive)_ | Significant   | https://github.com/thoth-tech/doubtfire-astro/pull/38 |
| Misconfigured CORS _(False Positive)_                                | Significant   | https://github.com/thoth-tech/doubtfire-astro/pull/41 |