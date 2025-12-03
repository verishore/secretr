# Changelog

All notable changes to Secretr will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [1.0.0] - 2025-12-03

### 🎉 First Public Release

This is the first public release of **Secretr**, a local-first, offline-capable secret management tool designed for developers, teams, and enterprises. All data stays on your device with military-grade encryption.

---

## Added

### 🔐 Core Security & Encryption

- **AES-256-GCM Encryption** - All secrets encrypted at rest using AES-256-GCM authenticated encryption
- **Argon2id Key Derivation** - NIST SP 800-57 compliant key derivation with configurable parameters
- **Device Fingerprint Binding** - Secrets bound to device hardware; vault cannot be copied to another device
- **Brute-force Protection** - Rate limiting and lockout after failed authentication attempts
- **HMAC-Signed Audit Logs** - Tamper-proof audit trail with hash chain verification
- **Vault Integrity Verification** - HMAC-SHA256 hash verification for vault, license, and audit files

### 📦 Secret Management (CLI)

- `get <key>` - Retrieve secrets with dot notation for nested JSON values
- `set <key> [value]` - Store secrets with optional TTL and expiration
- `delete <key>` - Remove secrets with optional recursive namespace deletion
- `list` - List all secret keys with namespace filtering and tree view
- `copy <key>` - Copy secrets to clipboard with auto-clear timeout
- `password set/remove/check` - Per-secret password protection layer
- `store` - Display raw vault contents for debugging

### 🔑 SSH & Certificate Management (CLI)

- `ssh <profile>` - Connect via SSH using stored credentials
- `ssh-key add/edit/delete/reveal/copy/list` - Full SSH key lifecycle management
- `ssh-profile add/edit/delete/show/list/apply` - SSH connection profiles with jump host support
- `certificate generate` - Self-signed X.509 certificate generation
- `sign` / `verify` - HMAC data signing and verification
- `hash` - SHA-256 hash generation

### ⚡ Cryptographic Generators (CLI)

- `gen-jwt` - JWT signing secret generation with configurable algorithms
- `gen-apikey` - Flexible API key generation with prefix, segments, and checksum
- `gen-keypair` - RSA, Ed25519, and ECDSA keypair generation
- `gen-symmetric` - Symmetric encryption key generation (128/192/256-bit)
- `dynamic` - Dynamic/ephemeral secret generation with TTL

### 📁 Encrypted File Vault (CLI)

- `files upload` - Upload files to encrypted vault with metadata
- `files get` - Download files from vault
- `files list` - List stored files with namespace filtering
- `files render` - Preview/render file contents
- `files delete` - Remove files from vault
- `files password set/remove/check` - Per-file password protection
- `files expiration set/remove/status` - File expiration management

### 🌐 Environment Integration (CLI)

- `env` - Display secrets as environment variables (shell, dotenv, json, yaml)
- `load-env` - Load environment file and store as secrets
- `enrich` - Enrich config files with secret values
- `copy-file` - Export secrets to `.env` or JSON config files
- Nested JSON flattening for ENV export (e.g., `aws` → `AWS_API_KEY`)

### 📤 Import & Export (CLI)

- `import` - Import encrypted bundles with merge/overwrite options
- `export` - Export vault to encrypted bundle
- `from-file` - Import from env/json/yaml files
- `import-from-server` / `export-to-server` - Remote server sync

### 💾 Backup & Recovery (CLI)

- `backup create` - Create encrypted backups with optional compression
- `backup restore` - Restore vault from backup with merge options
- `backup list` - List available backups

### 🔄 Secret Templates & Rotation (CLI)

- `template list/show/create/delete/apply` - Secret templates for DB, API, AWS credentials
- `rotate policy set/list/delete` - Rotation policies with interval-based scheduling
- `rotate run` - Execute due rotations
- `rotate cleanup` - Clean up dual-key entries after rotation

### 📝 Encrypted Scratchpad (CLI)

- `scratchpad new` - Create encrypted notes with optional TTL
- `scratchpad open/view/list/delete/clear` - Full scratchpad lifecycle
- `scratchpad expiration set/remove/status` - Expiration management
- Interactive editor with shortcuts (Ctrl+G for secret mode, Ctrl+S to save)

### 📊 Secret Versioning (CLI)

- `listkv <key>` - List all versions of a secret
- `rollbackkv <key> <version>` - Rollback to specific version
- `vcs list/show/switch/reset` - Unified version control for secrets, files, and scratchpads

### 🤝 Sharing & Collaboration (CLI)

#### ACL-Based Sharing
- `share grant/revoke` - Grant and revoke access to secrets
- `share request/approve/deny` - Access request workflows
- `share requests` - List pending share requests
- `share link create/list/revoke/redeem` - Time/use-limited share links
- `share notifications` - View and acknowledge share notifications

#### P2P Local Network Sharing
- `p2p-share` - Direct peer-to-peer sharing over LAN
- mDNS peer discovery
- End-to-end encryption (ECDH + AES-GCM)
- User alias for discovery

### 🏢 Multi-Tenant Support (CLI)

- `tenant create/list/switch` - Tenant management
- `tenant setkey/getkey` - Per-tenant admin keys
- Cross-tenant isolation
- Tenant-scoped exports

### 🔒 Authentication (CLI)

- `enable-2fa` / `disable-2fa` - TOTP two-factor authentication
- `enable-passkey` / `disable-passkey` - WebAuthn/Passkey authentication
- `enable-share-prompt` - Share prompt feature toggle
- Shamir Secret Sharing for master key (`shamir-split`, `shamir-combine`)

### 🛡️ Vault Security (CLI)

- `vault-security status` - Security status dashboard
- `vault-security policy show/set-default/set-high/set` - Security policy configuration
- `vault-security integrity verify/init/logs` - Integrity verification
- `vault-security threats` - Active threat monitoring
- `vault-security lock` - Emergency vault lock
- `vault-security wipe` - Secure DoD 5220.22-M vault destruction
- `reset-hard` - Interactive vault reset with confirmation

### 📋 Compliance & Governance (CLI)

- `compliance status/enable/disable/report/gaps/config` - Multi-framework compliance
  - SOC 2 Type II
  - PCI DSS v4.0
  - HIPAA Security Rule
  - GDPR
  - ISO 27001/27002
  - NIST Cybersecurity Framework 2.0
- `classify set/get/list/report/inventory` - Data classification (7 levels)
- `retention create/list/delete/check/enforce` - Data retention policies
- `breach report/list/notify` - Breach incident management
- `access-review start/list/show/approve/revoke/complete/export` - Periodic access reviews

### 🔬 FIPS Compliance (CLI)

- `fips status` - FIPS compliance status
- `fips enable/disable` - Toggle FIPS 140-2/140-3 mode
- `fips self-test` - Run FIPS self-tests
- `fips report` - Generate FIPS compliance report
- `fips validate` - Validate algorithm compliance

### 🐳 Container & Sandbox Execution (CLI)

#### Secure Sandbox
- `sandbox` - Run commands with secret injection
- `secure-sandbox` / `ssb` - Hardened sandbox with security isolation
  - Security levels: basic, hardened, isolated, maximum
  - Injection methods: env, file, memfd, socket
  - Memory protection: lock, scrub on exit
  - Process protection: no-ptrace, no-new-privs

#### Container Runtime (Linux)
- `container run` - Run isolated containers with secret injection
- `container exec/list/inspect/stop/remove/pause/resume/top/info` - Container lifecycle
- `container pentest` - Penetration testing tools
- `container audit` - Security audit
- Namespace isolation: PID, Mount, Network, IPC
- Cgroups resource limits
- Seccomp system call filtering

### 📊 Observability (CLI)

- `observability health` - Vault health status
- `observability metrics` - Vault metrics (Prometheus format)
- `observability audit` - Query audit logs with filtering
- `observability access` - Query secret access logs

### 🖥️ System Commands (CLI)

- `version` - Display version information
- `build-info` - Detailed build information
- `status` - Vault and license status
- `close` - Clear auth caches and master key shares
- `cli` - Enter interactive mode with autocomplete

---

### 🖼️ Desktop GUI (Fyne)

- **Cross-platform** - macOS, Windows, Linux support
- **Login Gate** - Master key authentication
- **Secret Manager** - Tabbed interface for secrets, files, SSH keys
- **File Manager** - Upload, download, preview with toolbar
- **SSH Key Management** - Add, edit, delete dialogs
- **Certificate UI** - Certificate generation and management
- **Password Generator** - Built-in generator dialog
- **Hash Generator** - SHA-256 hash generation
- **P2P Discovery** - Peer discovery and sharing UI
- **Backup/Restore** - Interactive backup management
- **2FA Setup** - TOTP configuration wizard
- **Vault Lock** - Emergency lock button
- **Settings** - Preferences and configuration

---

### 🌐 HTTP API Server (Pro Mode)

#### Server Configuration
- TLS support with configurable certificates
- CSRF protection with secure tokens
- Security headers (X-Frame-Options, CSP, HSTS)
- CSV/JSON/SQLite user authentication backends

#### Authentication Endpoints
- `POST /auth/login` - User login with JWT session
- `GET /auth/sessions` - List active sessions
- `DELETE /auth/sessions/:id` - Revoke session

#### Two-Factor Authentication Endpoints
- `GET /2fa/status` - 2FA status check
- `POST /2fa/setup/start` - Begin 2FA setup
- `POST /2fa/setup/verify` - Complete 2FA setup
- `POST /2fa/verify` - Verify 2FA code
- `DELETE /2fa` - Disable 2FA
- `GET /2fa/backup-code` - Get backup codes

#### Secrets Endpoints
- `GET /secretr/` or `/secretr/keys` - List all keys
- `GET /secretr/:key` - Retrieve secret
- `POST /secretr/:key` - Create/update secret
- `PUT /secretr/:key` - Update secret
- `DELETE /secretr/:key` - Delete secret
- `PATCH /secretr/clear` - Clear all secrets

#### KV Versioning Endpoints
- `GET /secretr/:key/versions` - List secret versions
- `POST /secretr/:key/rollback/:version` - Rollback to version

#### Transit Engine Endpoints
- `POST /transit/encrypt` - Encrypt data
- `POST /transit/decrypt` - Decrypt data
- `POST /transit/datakey` - Generate data key

#### Dynamic Secret Endpoints
- `POST /dynamic/database` - Generate database credentials
- `POST /dynamic/cloud` - Generate cloud tokens (AWS, Azure, GCP)
- `GET /dynamic/verify/:lease_id` - Verify lease validity

#### Response Wrapping Endpoints
- `POST /wrap` - Wrap response with token
- `POST /unwrap` - Unwrap wrapped response

#### File Management Endpoints
- `GET /api/files` - List stored files
- `POST /api/files` - Upload file (multipart/form-data)
- `GET /api/files/:filename` - Download file
- `GET /api/files/render/:filename` - Render image in browser
- `DELETE /api/files/:filename` - Delete file

#### SSH Management Endpoints
- `GET /api/ssh/keys` - List SSH keys
- `POST /api/ssh/keys` - Create SSH key
- `GET /api/ssh/keys/:name` - Get SSH key
- `DELETE /api/ssh/keys/:name` - Delete SSH key
- `GET /api/ssh/profiles` - List SSH profiles
- `POST /api/ssh/profiles` - Create SSH profile
- `GET /api/ssh/profiles/:name` - Get SSH profile
- `DELETE /api/ssh/profiles/:name` - Delete SSH profile

#### Certificate Endpoints
- `POST /api/certificates/generate` - Generate certificate

#### Generator Endpoints
- `POST /api/generate/jwt` - Generate JWT
- `POST /api/generate/apikey` - Generate API key
- `POST /api/generate/keypair` - Generate keypair
- `POST /api/generate/symmetric` - Generate symmetric key

#### User Management Endpoints
- `GET /api/scopes` - List available scopes
- `GET /api/users` - List users
- `POST /api/users` - Create user
- `GET /api/users/:username` - Get user
- `PUT /api/users/:username` - Update user
- `DELETE /api/users/:username` - Delete user
- `GET /api/users/:username/apikeys` - List user API keys
- `POST /api/users/:username/apikeys` - Create API key
- `GET /api/users/:username/apikeys/:id` - Get API key
- `PUT /api/users/:username/apikeys/:id` - Update API key
- `DELETE /api/users/:username/apikeys/:id` - Revoke API key

#### Tenant Management Endpoints
- `POST /api/tenants` - Create tenant
- `GET /api/tenants` - List tenants
- `POST /api/tenants/:name/key` - Set tenant admin key
- `GET /api/tenants/:name/key` - Get tenant admin key
- `POST /api/tenants/:name/secrets/:key` - Set tenant secret
- `GET /api/tenants/:name/secrets/:key` - Get tenant secret

#### Export/Import Endpoints
- `GET /api/export` - Export vault
- `POST /api/import` - Import vault

#### Backup/Restore Endpoints
- `POST /secretr/backup` - Create backup
- `POST /secretr/restore` - Restore from backup

#### Observability Endpoints
- `GET /healthz` - Liveness probe (uptime, version, commit)
- `GET /readyz` - Readiness probe (vault + storage status)
- `GET /metrics` - Prometheus metrics endpoint

---

### 🔧 Platform Support

#### Operating Systems
- **macOS** - Full feature support
- **Windows** - Full feature support (sandbox features limited)
- **Linux** - Full feature support including container runtime

#### Linux-Specific Features
- Namespace container isolation (PID, Mount, Network, IPC, User)
- Cgroups v1/v2 resource limits
- Seccomp system call filtering
- Landlock filesystem sandboxing
- Capability dropping

---

### 📋 Pricing Plans

| Plan | Price | Min Devices | Storage | Key Features |
|------|-------|-------------|---------|--------------|
| **Trial** | Free (7 days) | 1 | Unlimited | All features unlocked |
| **Personal** | $25/device/yr | 1 | 1 GB | Core secrets, SSH, generators, GUI |
| **Solo** | $60/device/yr | 2 | 5 GB | + 2FA, P2P sharing, audit, versioning |
| **Team** | $90/device/yr | 5 | 25 GB | + Scratchpads, templates, rotation, bundles |
| **Business** | $180/device/yr | 15 | Unlimited | + API server, user mgmt, ACL, multi-tenant |
| **Enterprise** | Custom | 50+ | Unlimited | + Compliance, FIPS, containers, HSM |
