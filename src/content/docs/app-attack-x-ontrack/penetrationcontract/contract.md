---
title: AppAttack X OnTrack Collaboration Agreement
---

**This Collaboration Agreement** is made and entered into on **18/03/2025** by and between:

1. **HardHat Enterprises** (“HardHat”), on behalf of its AppAttack project, and
2. **OnTrack** (“OnTrack”), a division under ThothTech.

HardHat and OnTrack may hereinafter be collectively referred to as the “Parties” or individually as a “Party.”

## 1. PURPOSE

The purpose of this Agreement is to establish a collaborative relationship wherein **HardHat’s
AppAttack team** will provide penetration-testing, secure code review, and cybersecurity
assessment services to OnTrack’s software applications and backend systems. These services are
intended to help identify, document, and recommend solutions for security vulnerabilities in the
OnTrack project, including (but not limited to) the front-end and back-end of the web application,
related infrastructure, and the codebase.

## 2. SCOPE OF SERVICES

**1. Penetration Testing and Assessment**

```
Testing Format:
```
- External (Ethical Audit With Limited Credential Access): AppAttack will evaluate OnTrack primarily as an external adversary, using minimal or restricted credentials to simulate attacks from outside the organization. This approach focuses on identifying potential entry points and vulnerabilities that an attacker without privileged knowledge could exploit.
- Internal (Low-Level Access): AppAttack will also conduct tests from an internal perspective, where testers have low-level, legitimate access to OnTrack’s systems (e.g., student or basic tutor account). This allows for assessing risks related to privilege escalation, lateral movement, and other insider threats.
- Secure Code Review: AppAttack will perform a secure code review of the OnTrack application to identify vulnerabilities such as input validation issues, authentication flaws, insecure data handling, and potential injection risks. This review aims to proactively spot weaknesses in the codebase that could be exploited before they can be targeted in an attack.

```
Tools and Techniques:
```

- AppAttack will leverage a combination of industry-standard tools and custom scripts. Core tools may include Nessus (for network vulnerability scanning), Burp Suite (for web
application analysis), Snyk (for secure code review), and other relevant solutions (e.g.,
OWASP ZAP, Nikto, custom Python scripts) to identify, validate, and report security issues.

```
Scope Coverage:
```
- The exact scope (endpoints, subdomains, code repositories, data stores) will be clarifiedand mutually agreed upon before testing commences.
- AppAttack will not exceed the boundaries of the agreed-upon scope without prior written
permission.

**2. Deliverables**

- **Penetration Testing Report:** A comprehensive report outlining identified
vulnerabilities, risk ratings, potential impacts, and recommended remediation
measures.

- **Executive Summary:** A high-level overview of findings suitable for non-technical
stakeholders.

- **Verification Tests:** OnTrack previously conducted a basic OWASP Top 10 scan last
trimester but did not perform follow-up testing to confirm or remediate the reported
vulnerabilities. If requested, AppAttack can retest those previously identified issues
and validate any implemented fixes. Results of this verification will be included in
the final deliverable.

**3. Timeframe**

- The testing period will be composed of two stages. The **first stage** will begin on or around **24/03/2025** to **28/04/2025**, focusing on testing the current version of OnTrack. 
- The **second stage** will run from **28/04/2025** to **12/05/2025**, where the updated version will be tested. We will provide separate updates on our findings on **07/04/2025** and **12/05/2025**.

    **Option A – Live (Rolling) Pen-testing: (YES)**
    - AppAttack will continuously test OnTrack’s latest build throughout the trimester. Whenever testers confirm a potential vulnerability, immediate feedback is provided to OnTrack.
    - Once OnTrack applies a fix or releases a new version, AppAttack will download and re-run targeted tests to confirm if the vulnerability has been resolved.
    - This iterative process continues until a final consolidated report is delivered encompassing all discovered vulnerabilities, retest outcomes, and recommended mitigations.
    - Any extensions or scope expansions beyond what is initially agreed must be documented in writing.

    **Option B – End-of-Trimester Final Report: (YES)**
    - AppAttack will perform a scheduled penetration test over a defined period, concluding near the end of the trimester.
    - A single comprehensive report will then be prepared, capturing all identified vulnerabilities, remediation guidance, and an executive summary.
    - Retesting specific fixes can be arranged either before the final delivery or during a follow-up engagement, as mutually agreed.

    **Both options have been agreed upon as seen in the first dot-point for the first two update findings, with the final report being on the 1 2/05/ 2025.**

**4. Location & Environment:**
- Penetration tests will take place on **AppAttack Auditing Virtual Machine** and/or limited production environment (if absolutely necessary).
- OnTrack is responsible for providing the required access credentials (GitHub access or other), system documentation, and test accounts or supporting resources.

**5. Limitations**

- Any areas, applications, systems, or resources **excluded** from testing shall be
documented and signed off by both Parties in the project scope statement.
- AppAttack will not attempt to access or compromise systems outside the agreed-
upon scope without prior written permission.

---
## 3. RESPONSIBILITIES
**1. HardHat (AppAttack)**

- Provide qualified penetration testers and security engineers.
- Follow established ethical hacking practices and legal standards.
- Maintain the confidentiality of all OnTrack data, findings, and materials accessed during testing.
- Deliver final reports, remediation recommendations, and (if agreed) conduct a
follow-up session to clarify results.

**2. OnTrack**

- Provide HardHat with timely access to all environments, documentation,
credentials, and permissions required for penetration testing.
- Disclose known vulnerabilities, prior breaches (if relevant), or any compliance
constraints.

**3. Joint Responsibilities**

- Coordinate so that pen-testing activities do not unreasonably disrupt OnTrack’s business operations.
- Communicate any changes to scope, timeline, or constraints.

---

## 4. CONFIDENTIALITY

**1. Definition**
- “Confidential Information” includes but is not limited to technical data, test credentials, system architecture, IP addresses, proprietary business information, and any vulnerabilities discovered.

**2. Obligations**
- Both Parties agree to treat each other’s Confidential Information with at least the same degree of care used to protect their own confidential information, but not less than a reasonable standard of care.
-  Each Party will only use the other Party’s Confidential Information for the purposes of carrying out obligations under this Agreement.

**3. Exclusions**
- Information that is already public or becomes public (through no fault of the
       receiving Party) will not be deemed Confidential.
- This Agreement does not prevent disclosures required by law or court order, provided the disclosing Party gives prompt written notice to the other Party before disclosure so that the other Party may seek a protective order or other remedy.

---

## 5. LEGAL COMPLIANCE AND WARRANTIES

**1. Compliance with Laws**
- Both Parties shall comply with all applicable laws, regulations, and local requirements regarding security testing and data privacy.
- HardHat’s testing methods shall comply with ethical standards, including OWASP,NIST, or other recognized guidelines, ensuring that no illegal intrusions or malicious acts occur outside the stated scope.

**2. Disclaimer**
- HardHat makes no guarantee that penetration testing, or security assessments will identify all possible vulnerabilities or threats. OnTrack acknowledges that cybersecurity testing is inherently a best-efforts activity and that new vulnerabilities may emerge after the engagement.
- Except as expressly stated in this Agreement, **no other warranties** (express or implied) are made regarding the services provided.

---
## 6. LIMITATION OF LIABILITY

**1. Consequential Damages**
- Neither Party shall be liable for any indirect, incidental, consequential, or special damages (such as loss of profits or business opportunities) arising out of or related to this Agreement, even if advised of the possibility of such damages.

**2. Aggregate Liability**
- Each Party’s total cumulative liability for any claims arising under or in connection with this Agreement shall be limited to the fees actually paid (if any) for the services performed, or an amount mutually agreed in writing.
---
## 7. TERM AND TERMINATION

**1. Term**
- This Agreement shall commence on the Effective Date and remain in effect until the completion of the pen-testing engagement, unless otherwise extended or terminated by mutual written consent.

**2. Effect of Termination**
- Upon termination, both Parties shall return or destroy all Confidential Information as requested by the disclosing Party, subject to any data retention requirements or regulations.

---
## 8. INTELLECTUAL PROPERTY

**1. Ownership**
- Any reports, documentation, or deliverables created by HardHat (AppAttack) as part of this engagement remain the intellectual property of HardHat until the final report is created and sent to the OnTrack team.

- OnTrack retains all rights to its underlying software code, data, and other
intellectual property used during testing.

**2. Use of Reports**
- OnTrack shall have a perpetual, royalty-free right to use, reproduce, and internally
distribute HardHat’s final deliverables, including final reports, only for OnTrack’s
internal security remediation and compliance.

- Public disclosure of any portion of the final report requires mutual written consent
unless legally mandated.

---
## 9. DISPUTE RESOLUTION

Any dispute arising out of or in connection with this Agreement shall be resolved by good-faith
negotiations between authorized representatives of the Parties. If the dispute cannot be resolved,
both Parties agree to pursue mediation through our **Mentors**.

---
## 10. GOVERNING LAW

This Agreement shall be governed by and construed in accordance with the laws of **[State of
Victoria, Australia],** without regard to its conflict-of-law’s provisions.

---
## 11. SIGNATURES

IN WITNESS WHEREOF, each Party, by the signature of its duly authorized representative, has executed this Collaboration Agreement as of the Effective Date stated above.

**For HardHat (AppAttack):**  
- **Signature:** Darryl Jun Ooi  
**Name:** Darryl Ooi  
**Title:** AppAttack PT & SCR Senior Lead  
**Date:** 14/03/2025

- **Signature:** Shehani Natasha De Sayrah Wickremasekera  
**Name:** Shehani Wickremasekera  
**Title:** AppAttack PT & SCR Senior Lead  
**Date:** 18/03/2025

**For ThothTech OnTrack:** 
- **Signature:** Atharv  
**Name:** Atharv Sandip Bhandare  
**Title:** OnTrack Senior Lead  
**Date:** 18/03/2025
