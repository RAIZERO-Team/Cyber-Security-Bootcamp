# CORS (Cross-Origin Resource Sharing) Vulnerabilities

## 2. CORS Vulnerabilities Overview

### Explanation of the Vulnerability
Cross-Origin Resource Sharing (CORS) is a mechanism that allows web applications to make requests to domains other than the one from which the application was served. CORS headers specify which external domains are permitted to access certain resources. If improperly configured, CORS vulnerabilities can expose sensitive data or allow malicious actors to interact with resources in unauthorized ways.

When CORS is improperly configured, it can lead to vulnerabilities such as unauthorized access to private APIs, data leakage, or the ability for malicious websites to interact with web services on behalf of authenticated users.

### Real-World Examples

#### Example 1: **Uber CORS Flaw (2016)**
Uber's public API had a CORS vulnerability where a misconfigured CORS policy allowed cross-origin access to Uber's private user data, such as geolocation and trip history. Attackers could craft requests from an external domain and steal sensitive data from users who were authenticated with Uber, such as tracking users’ trips.

#### Example 2: **AngularJS CORS Misconfiguration (2018)**
A security researcher discovered a vulnerability in AngularJS applications where the default CORS settings did not properly validate the `Origin` header. This allowed any website to send cross-origin requests to the application’s backend and retrieve sensitive data, such as authentication tokens, from the victim’s browser.

#### Example 3: **Alibaba CORS Attack (2018)**
Alibaba's e-commerce platform had a misconfigured CORS header that allowed external websites to perform unauthorized actions like modifying orders or accessing user payment data. The vulnerability was exploited by an attacker who managed to inject JavaScript into a trusted third-party website.

### Root Causes
- **Over-Permissive `Access-Control-Allow-Origin` Header**: If the `Access-Control-Allow-Origin` header is set to `*` (wildcard), it means any origin can make requests to the server, potentially leading to sensitive data exposure.
- **Lack of Origin Validation**: If the application doesn’t properly validate the `Origin` header or the `Referer` header, it may inadvertently allow malicious websites to interact with its resources.
- **Allowing Credentials (Cookies, HTTP Authentication)**: Misconfiguring CORS to allow credentials to be sent in cross-origin requests can lead to authentication tokens or session cookies being leaked.

### Mitigation Strategies
- **Restrict Allowed Origins**: Avoid using the wildcard (`*`) in the `Access-Control-Allow-Origin` header. Instead, specify a list of trusted domains.
- **Validate `Origin` and `Referer` Headers**: Ensure the application checks the `Origin` and `Referer` headers in incoming requests to ensure they come from trusted sources.
- **Use `Access-Control-Allow-Credentials` Carefully**: Set `Access-Control-Allow-Credentials` to `true` only when necessary, and be sure that the `Access-Control-Allow-Origin` header is not a wildcard when credentials are allowed.
- **Use Preflight Requests**: Configure the server to handle OPTIONS preflight requests. This will help ensure that cross-origin requests are properly validated before processing.