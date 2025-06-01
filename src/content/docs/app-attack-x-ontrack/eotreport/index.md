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

## Guidance for Future Security Contributors

To ensure continuity and avoid duplication, the following table provides a quick reference of vulnerabilities already addressed during the AppAttack x OnTrack collaboration. Future contributors should **not rework** these fixes unless new risks are identified.

| Vulnerability Name                                                   | Impact Level  | PR Link     |
| -------------------------------------------------------------------- | ------------- | ----------- |
| Clickjacking                                                         | Severe        | [doubtfire-deploy](#https://github.com/thoth-tech/doubtfire-deploy/pull/28) [doubtfire-web](#https://github.com/thoth-tech/doubtfire-web/pull/321) [doubtfire-dcoumentation](#https://github.com/thoth-tech/documentation/pull/593) |
| Insecure Direct Object Reference (IDOR)                              | Major         | [View PR](#) |
| Malicious Code Execution                                             | Major         | [Pending](#) |
| Exposed JavaScript Source Maps _(False Positive)_                    | Major         | N/A         |
| Session Hijacking and Fixation                                       | Significant   | [Pending](#) |
| Token Exposure via Local Storage and HTTP Headers _(False Positive)_ | Significant   | N/A         |
| Misconfigured CORS _(False Positive)_                                | Significant   | N/A         |