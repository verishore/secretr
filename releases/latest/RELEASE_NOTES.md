# Release Notes - Secretr v1.0.0

**Release Date:** December 3, 2025
**Type:** First Public Release
**License:** Proprietary (see pricing plans)

---

## 🎉 Welcome to Secretr!

We're thrilled to announce the first public release of **Secretr**, a comprehensive, local-first secret management solution built for developers, teams, and enterprises.

### Why Secretr?

- **🔒 Local-First** - Your secrets never leave your device unless you explicitly share them
- **🌐 Offline-Capable** - No internet required for core operations
- **💪 Military-Grade Encryption** - AES-256-GCM with Argon2id key derivation
- **🔗 Device-Bound** - Hardware fingerprinting prevents unauthorized vault copying
- **📱 Cross-Platform** - CLI, GUI, and API interfaces for macOS, Windows, and Linux

---

## 📦 What's Included

### For Individual Developers (Personal Plan)

Start managing your secrets securely with:

- **Secret CRUD** - Store, retrieve, update, and delete secrets with nested key support
- **SSH Key Management** - Store and manage up to 3 SSH keys and profiles
- **Encrypted File Vault** - 1 GB of encrypted file storage
- **Password Generator** - Create strong passwords, PINs, and API keys
- **Desktop GUI** - Beautiful Fyne-based cross-platform interface
- **Environment Integration** - Export secrets to `.env` files and config files
- **Backup & Restore** - Manual encrypted backups

### For Power Users (Solo Plan)

Everything in Personal, plus:

- **Two-Factor Authentication** - TOTP and WebAuthn/Passkey support
- **Shamir Secret Sharing** - Distribute master key for disaster recovery
- **P2P Sharing** - Share secrets over local network with end-to-end encryption
- **Secret Versioning** - Track changes and rollback to previous versions
- **Audit Logging** - HMAC-signed, tamper-proof audit trail
- **Advanced File Vault** - 5 GB storage with tagging and properties

### For Teams (Team Plan)

Everything in Solo, plus:

- **Encrypted Scratchpads** - Secure notes and temporary content
- **Secret Templates** - Pre-defined templates for database, API, and cloud credentials
- **Rotation Policies** - Automated secret rotation with dual-key overlap
- **Bundle Import/Export** - Encrypted bundles for team sharing
- **Server Mode** - Run Secretr as an HTTP API server
- **25 GB Storage** - Ample space for team secrets and files

### For Organizations (Business Plan)

Everything in Team, plus:

- **HTTP API Server** - Full REST API with JWT authentication
- **User Management** - Create users, manage API keys and scopes
- **Access Control Lists** - Fine-grained permission management
- **Multi-Tenant Support** - Isolated environments for different projects
- **Data Retention** - Automated cleanup policies
- **Secure Sandbox** - Run commands with secret injection
- **Prometheus Metrics** - Full observability stack
- **Unlimited Storage** - No limits on secrets or files

### For Enterprises (Enterprise Plan)

Everything in Business, plus:

- **Compliance Frameworks** - SOC 2, PCI DSS, HIPAA, GDPR, ISO 27001, NIST CSF
- **FIPS 140-2/140-3 Mode** - Government-grade encryption compliance
- **Data Classification** - 7-level classification system with auto-detection
- **Breach Management** - Incident tracking and notification workflows
- **Access Reviews** - Quarterly/annual access certification
- **Container Runtime** - Linux container isolation with namespace support
- **HSM Integration** - Hardware security module support (PKCS#11)
- **Priority Support** - Dedicated support channel

---

## 🚀 Quick Start

### First Secret

```bash
# Store a secret
secretr set api.key "sk_live_abc123"

# Retrieve it
secretr get api.key

# Or use shorthand
secretr api.key
```

### Environment Integration

```bash
# Export secrets to .env file
secretr copy-file --file=.env api.key db.password

# Use in scripts
export SECRETR_MASTERKEY="your-master-key"
API_KEY=$(secretr api.key)
```

### Run API Server (Business+)

```bash
secretr -mode=pro -server -http-addr :8080
```

---

## 🖥️ CLI Command Categories

| Category | Commands |
|----------|----------|
| **Core** | `get`, `set`, `delete`, `list`, `copy`, `store` |
| **SSH** | `ssh`, `ssh-key`, `ssh-profile` |
| **Files** | `files upload/get/list/render/delete` |
| **Generators** | `gen-jwt`, `gen-apikey`, `gen-keypair`, `gen-symmetric`, `dynamic` |
| **Environment** | `env`, `load-env`, `enrich`, `copy-file` |
| **Backup** | `backup create/restore/list` |
| **Templates** | `template list/show/create/delete/apply` |
| **Rotation** | `rotate policy set/list/delete`, `rotate run` |
| **Sharing** | `share grant/revoke/request/approve/deny`, `p2p-share` |
| **Versioning** | `listkv`, `rollbackkv`, `vcs` |
| **Scratchpad** | `scratchpad new/open/view/list/delete` |
| **Security** | `vault-security status/policy/integrity/lock/wipe` |
| **Auth** | `enable-2fa`, `disable-2fa`, `enable-passkey`, `disable-passkey` |
| **Compliance** | `compliance`, `classify`, `retention`, `breach`, `access-review` |
| **FIPS** | `fips status/enable/disable/self-test/report` |
| **Container** | `container run/exec/list/inspect/stop/remove` |
| **Sandbox** | `sandbox`, `secure-sandbox`, `ssb` |
| **Observability** | `observability health/metrics/audit/access` |
| **Tenant** | `tenant create/list/switch/setkey/getkey` |
| **Server** | `server`, `server-config` |
| **System** | `version`, `build-info`, `status`, `close`, `cli` |

---

## 🌐 API Endpoints Overview

### Public Endpoints
- `GET /healthz` - Liveness probe
- `GET /readyz` - Readiness probe
- `GET /metrics` - Prometheus metrics

### Authentication
- `POST /auth/login` - Login
- `GET /auth/sessions` - List sessions
- `DELETE /auth/sessions/:id` - Revoke session

### Secrets
- `GET /secretr/keys` - List keys
- `GET /secretr/:key` - Get secret
- `POST /secretr/:key` - Set secret
- `DELETE /secretr/:key` - Delete secret

### Files
- `GET /api/files` - List files
- `POST /api/files` - Upload file
- `GET /api/files/:name` - Download file
- `DELETE /api/files/:name` - Delete file

### Users (Business+)
- `GET /api/users` - List users
- `POST /api/users` - Create user
- `PUT /api/users/:username` - Update user
- `DELETE /api/users/:username` - Delete user

### Tenants (Business+)
- `GET /api/tenants` - List tenants
- `POST /api/tenants` - Create tenant

For complete API documentation, see `docs/COMMANDS.md`.

---

## 🖼️ GUI Features

The desktop GUI provides:

- **Secure Login** - Master key entry with lockout protection
- **Secret Browser** - Tree view with search and filtering
- **File Manager** - Drag-and-drop upload, preview, and download
- **SSH Manager** - Key and profile management
- **Generators** - Password, API key, and certificate generation
- **Backup Manager** - Create and restore backups
- **P2P Discovery** - Find and share with peers on local network
- **Settings** - Preferences and security configuration

---

## 💰 Pricing

| Plan | Price | Min Devices | Storage |
|------|-------|-------------|---------|
| **Trial** | Free (7 days) | 1 | Unlimited |
| **Personal** | $25/device/yr | 1 | 1 GB |
| **Solo** | $60/device/yr | 2 | 5 GB |
| **Team** | $90/device/yr | 5 | 25 GB |
| **Business** | $180/device/yr | 15 | Unlimited |
| **Enterprise** | Custom | 50+ | Unlimited |

### Volume Discounts
- 25-49 devices: 10% off
- 50-99 devices: 15% off
- 100-249 devices: 20% off
- 250-499 devices: 25% off
- 500+ devices: 30% off + Contact sales

### Launch Promotion
First 500 customers who purchase any paid plan with at least the minimum device count plus 25 additional devices receive an automatic **5% discount** at checkout.

---

## 🔐 Security Highlights

### Encryption
- **Algorithm**: AES-256-GCM authenticated encryption
- **Key Derivation**: Argon2id (PBKDF2 in FIPS mode)
- **At Rest**: All secrets encrypted on disk
- **In Transit**: TLS 1.3 for API communications

### Access Control
- Hardware device fingerprinting
- Two-factor authentication (TOTP, WebAuthn)
- Shamir secret sharing for master key
- Rate limiting and brute-force protection

### Audit & Compliance
- HMAC-signed audit logs with hash chains
- Tamper detection and auto-response
- FIPS 140-2/140-3 compliance mode
- SOC 2, PCI DSS, HIPAA, GDPR, ISO 27001, NIST CSF

### Container Security (Linux)
- Namespace isolation (PID, Mount, Network, IPC, User)
- Cgroups resource limits
- Seccomp system call filtering
- Capability dropping
- Landlock filesystem sandboxing

---

## 📚 Documentation

- [README.md](README.md) - Quick start guide
- [docs/COMMANDS.md](docs/COMMANDS.md) - Complete CLI reference
- [docs/FEATURES.md](docs/FEATURES.md) - Feature comparison
- [docs/COMPLIANCE.md](docs/COMPLIANCE.md) - Compliance details
- [docs/FIPS.md](docs/FIPS.md) - FIPS compliance
- [docs/CONTAINER_SECURITY.md](docs/CONTAINER_SECURITY.md) - Container isolation
- [docs/SECURITY_IMPLEMENTATION.md](docs/SECURITY_IMPLEMENTATION.md) - Security architecture
- [SECURITY.md](SECURITY.md) - Security policy

---

## 🐛 Known Issues

1. **Container runtime** requires Linux with namespace support
2. **Landlock sandboxing** requires Linux kernel 5.13+
3. **GUI on Wayland** may have clipboard integration issues
4. **HSM integration** requires compatible PKCS#11 hardware

---

## 🙏 Acknowledgments

Special thanks to:
- The Go community for excellent cryptographic libraries
- Fyne project for the cross-platform GUI toolkit
- All beta testers who provided invaluable feedback

---

## 📧 Support

- **Documentation**: https://github.com/oarkflow/secretr/docs
- **Issues**: https://github.com/oarkflow/secretr/issues
- **Email**: support@secretr.dev
- **Enterprise Support**: enterprise@secretr.dev

---

## ⬆️ Upgrading

This is the first public release. Future upgrade instructions will be provided in subsequent release notes.

---

## 📜 License

Secretr is proprietary software. See [LICENSE](LICENSE) for details.

---

**Thank you for choosing Secretr!** 🔐

We're committed to making secret management simple, secure, and developer-friendly. Your feedback helps us improve - please don't hesitate to reach out with questions, suggestions, or bug reports.
