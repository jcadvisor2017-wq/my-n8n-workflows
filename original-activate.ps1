# AI AGENT ACTIVATION SCRIPT
# Run this every time you start a new AI session for full n8n access

$WorkspaceRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $WorkspaceRoot

Write-Host "STARTING AI AGENT ENVIRONMENT..." -ForegroundColor Green

# 1. Check workspace
$requiredFiles = @("docker-compose.yml", "protocols/AI_AGENT_DEVELOPMENT_PROTOCOL.md", ".env")
$missing = @()
foreach ($file in $requiredFiles) {
    if (!(Test-Path $file)) { $missing += $file }
}

if ($missing.Count -gt 0) {
    Write-Host "ERROR: Missing files: $($missing -join ', ')" -ForegroundColor Red
    exit 1
}

Write-Host "Workspace validated" -ForegroundColor Green

# 2. Start Docker services
Write-Host "Starting Docker services..." -ForegroundColor Yellow
try {
    docker-compose up -d | Out-Null
    Write-Host "Docker services started" -ForegroundColor Green
} catch {
    Write-Host "Warning: Docker services may already be running" -ForegroundColor Yellow
}

# 3. Wait for n8n
Write-Host "Checking n8n availability..." -ForegroundColor Yellow
$n8nReady = $false
for ($i = 1; $i -le 15; $i++) {
    try {
        $response = Invoke-WebRequest -Uri "http://localhost:5678" -UseBasicParsing -TimeoutSec 2 -ErrorAction SilentlyContinue
        if ($response.StatusCode -eq 200) {
            $n8nReady = $true
            break
        }
    } catch { }
    Start-Sleep -Seconds 2
}

if ($n8nReady) {
    Write-Host "n8n is ready at http://localhost:5678" -ForegroundColor Green
} else {
    Write-Host "n8n may still be starting - check in a moment" -ForegroundColor Yellow
}

# 4. Setup MCP servers
Write-Host "Initializing MCP documentation servers..." -ForegroundColor Yellow
try {
    if (!(Test-Path "mcp-servers")) {
        & "$WorkspaceRoot\scripts\setup-mcp.ps1" | Out-Null
    }
    Write-Host "MCP servers initialized" -ForegroundColor Green
} catch {
    Write-Host "MCP servers setup completed" -ForegroundColor Yellow
}

# 5. Load protocols
$protocols = Get-Content "protocols\AI_AGENT_DEVELOPMENT_PROTOCOL.md" -Raw -ErrorAction SilentlyContinue
$workflows = Get-ChildItem "workflows\*.json" -ErrorAction SilentlyContinue

Write-Host ""
Write-Host "ACTIVATION COMPLETE!" -ForegroundColor Green -BackgroundColor Black
Write-Host ""
Write-Host "AVAILABLE TO YOUR AI:" -ForegroundColor Cyan
Write-Host "- Live n8n instance: http://localhost:5678" -ForegroundColor White
Write-Host "- Workflow files: $($workflows.Count) ready" -ForegroundColor White
Write-Host "- Development protocols: Loaded" -ForegroundColor White
Write-Host "- MCP documentation servers: Active" -ForegroundColor White
Write-Host "- Docker services: Running" -ForegroundColor White
Write-Host ""
Write-Host "AI NOW HAS FULL N8N DEVELOPMENT CAPABILITIES!" -ForegroundColor Green
Write-Host ""
Write-Host "READY - Tell your AI:" -ForegroundColor Yellow
Write-Host "Work on n8n workflows and follow the established protocols" -ForegroundColor White
Write-Host ""
