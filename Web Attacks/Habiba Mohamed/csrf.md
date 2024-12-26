# CSRF (Cross-Site Request Forgery)

## 3. CSRF Vulnerabilities Overview

### Explanation of the Vulnerability
Cross-Site Request Forgery (CSRF) is an attack in which a malicious actor tricks a user into submitting an unwanted request to a web application on which the user is authenticated. Since the browser automatically includes authentication credentials (e.g., cookies) with each request, the application may process this forged request as if it were legitimate.

CSRF exploits the trust that a web application has in the user's browser. By making use of this trust, an attacker can perform actions on behalf of an authenticated user without their consent.

#### Types of CSRF Attacks:
- **State-Changing Requests**: Actions like changing a password, initiating a transfer, or making a purchase can be performed without the user’s knowledge.
- **Stored CSRF**: A CSRF payload is stored on the server (e.g., in a comment section or user profile) and executed when the victim accesses the page.
- **Reflected CSRF**: The attack is executed immediately after clicking a malicious link or visiting a page with a crafted request.

### Real-World Examples

#### Example 1: **PayPal CSRF Attack (2008)**
In 2008, attackers exploited a CSRF vulnerability on PayPal’s website. A malicious website would make requests to PayPal's server on behalf of an authenticated user, triggering money transfers from the user’s PayPal account to the attacker’s. The attack was successful because PayPal didn’t validate the request’s origin, allowing the attacker to bypass the victim’s consent.

#### Example 2: **WordPress CSRF Vulnerability (2017)**
WordPress’s post comment functionality allowed attackers to inject malicious JavaScript in blog comments. When an admin visited the page with the malicious comment, the JavaScript would submit a CSRF attack that changed the admin’s password or performed other administrative actions on their behalf.

#### Example 3: **GitHub CSRF Attack (2016)**
GitHub's issue creation feature was vulnerable to CSRF. By embedding a hidden form in a malicious website, attackers were able to perform actions on GitHub accounts without the user’s consent, such as creating issues or pushing unwanted changes.

### Root Causes
- **Absence of Anti-CSRF Tokens**: If the application does not require unique tokens for state-changing requests, attackers can submit fraudulent requests without detection.
- **Cookie-Based Authentication**: Cookies are automatically sent with every request to the same domain, allowing attackers to hijack a session and make unauthorized requests.
- **Improper Validation of Requests**: Failing to properly validate the origin or integrity of requests, trusting requests from any domain, allows CSRF attacks to succeed.

### Mitigation Strategies
- **Anti-CSRF Tokens**: Each state-changing request (e.g., form submission) should include a unique token, and the server should validate the token before processing the request.
- **SameSite Cookies**