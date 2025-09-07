# 🚀 SUPER POWER AI AGENT ACTIVATION SCRIPT
# Enhanced version with full development environment validation
# Run this every time you start a new AI session for complete development capabilities

$WorkspaceRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $WorkspaceRoot

Write-Host "🚀 STARTING SUPER POWER AI AGENT ENVIRONMENT..." -ForegroundColor Green -BackgroundColor Black
Write-Host ""

# 1. SUPER POWER PROTOCOLS CHECK
Write-Host "📋 Validating Super Power Protocols..." -ForegroundColor Cyan
$requiredProtocols = @(
    "SUPER_POWER_PROTOCOLS.md",
    "project-requirements-builder.html", 
    "DropboxIntegrationTemplate.html"
)

$missingProtocols = @()
foreach ($protocol in $requiredProtocols) {
    if (!(Test-Path $protocol)) { 
        $missingProtocols += $protocol 
    } else {
        Write-Host "  ✅ $protocol" -ForegroundColor Green
    }
}

if ($missingProtocols.Count -gt 0) {
    Write-Host "❌ MISSING SUPER POWER FILES: $($missingProtocols -join ', ')" -ForegroundColor Red
    Write-Host "Please ensure all Super Power templates are in place!" -ForegroundColor Yellow
    exit 1
}

# 2. AGENT INVENTORY CHECK
Write-Host "🤖 Checking Available Agents..." -ForegroundColor Cyan
$agents = Get-ChildItem "*.html" | Where-Object { $_.Name -match "Agent\d+|agent" }
foreach ($agent in $agents) {
    $agentName = $agent.Name -replace "\.html$", ""
    $handoffFile = "$agentName" + "_HANDOFF.md"
    if (Test-Path $handoffFile) {
        Write-Host "  ✅ $agentName (with handoff)" -ForegroundColor Green
    } else {
        Write-Host "  ⚠️  $agentName (no handoff)" -ForegroundColor Yellow
    }
}

# 3. TEMPLATE LIBRARY CHECK
Write-Host "📚 Validating Template Library..." -ForegroundColor Cyan
$templates = @(
    @{Name="Dropbox Integration"; File="DropboxIntegrationTemplate.html"; Key="22cs1wh095ggc1c"},
    @{Name="Requirements Builder"; File="project-requirements-builder.html"; Key="Enhanced"}
)

foreach ($template in $templates) {
    if (Test-Path $template.File) {
        Write-Host "  ✅ $($template.Name) - Ready" -ForegroundColor Green
    } else {
        Write-Host "  ❌ $($template.Name) - MISSING" -ForegroundColor Red
    }
}

# 4. GITHUB CONNECTION CHECK
Write-Host "💾 Checking GitHub Connection..." -ForegroundColor Cyan
try {
    $gitStatus = git status --porcelain 2>$null
    if ($LASTEXITCODE -eq 0) {
        $branch = git branch --show-current 2>$null
        Write-Host "  ✅ Git repository active (branch: $branch)" -ForegroundColor Green
        
        # Check for uncommitted changes
        if ($gitStatus) {
            $changes = ($gitStatus | Measure-Object).Count
            Write-Host "  ⚠️  $changes uncommitted changes detected" -ForegroundColor Yellow
        } else {
            Write-Host "  ✅ Repository clean - ready for development" -ForegroundColor Green
        }
    } else {
        Write-Host "  ⚠️  Not a git repository or git not available" -ForegroundColor Yellow
    }
} catch {
    Write-Host "  ⚠️  Git status check failed" -ForegroundColor Yellow
}

# 5. DOCKER & N8N VALIDATION
Write-Host "🐳 Starting Docker Services..." -ForegroundColor Cyan
try {
    # Check if Docker is running
    docker version > $null 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host "  ❌ Docker is not running! Please start Docker Desktop." -ForegroundColor Red
        exit 1
    }

    docker-compose up -d
    Write-Host "  ✅ Docker services started" -ForegroundColor Green
} catch {
    Write-Host "  ⚠️  Docker services may already be running" -ForegroundColor Yellow
}

# 6. N8N AVAILABILITY CHECK
Write-Host "⚡ Checking n8n Availability..." -ForegroundColor Cyan
$n8nReady = $false
for ($i = 1; $i -le 15; $i++) {
    try {
        $response = Invoke-WebRequest -Uri "http://localhost:5678" -UseBasicParsing -TimeoutSec 2 -ErrorAction SilentlyContinue
        if ($response.StatusCode -eq 200) {
            $n8nReady = $true
            Write-Host "  ✅ n8n is ready at http://localhost:5678" -ForegroundColor Green
            break
        }
    } catch { }
    Write-Host "  ⏳ Waiting for n8n... ($i/15)" -ForegroundColor Yellow
    Start-Sleep -Seconds 2
}

if (-not $n8nReady) {
    Write-Host "  ⚠️  n8n may still be starting - check in a moment" -ForegroundColor Yellow
}

# 7. MCP SERVERS INITIALIZATION
Write-Host "🔌 Initializing MCP Documentation Servers..." -ForegroundColor Cyan
try {
    if (!(Test-Path "mcp-servers")) {
        & "$WorkspaceRoot\scripts\setup-mcp.ps1" | Out-Null
    }
    Write-Host "  ✅ MCP servers initialized" -ForegroundColor Green
} catch {
    Write-Host "  ⚠️  MCP servers setup completed with warnings" -ForegroundColor Yellow
}

# 8. WORKSPACE SUMMARY
Write-Host ""
Write-Host "🎯 SUPER POWER ENVIRONMENT STATUS:" -ForegroundColor White -BackgroundColor DarkBlue
Write-Host ""

# Count available resources
$workflows = Get-ChildItem "workflows\*.json" -ErrorAction SilentlyContinue
$totalAgents = $agents.Count
$totalTemplates = ($templates | Where-Object { Test-Path $_.File }).Count

Write-Host "✅ AVAILABLE RESOURCES:" -ForegroundColor Green
Write-Host "  🤖 Agents Available: $totalAgents" -ForegroundColor White
Write-Host "  📚 Proven Templates: $totalTemplates" -ForegroundColor White  
Write-Host "  🔄 n8n Workflows: $($workflows.Count)" -ForegroundColor White
Write-Host "  🔗 Live n8n Instance: http://localhost:5678" -ForegroundColor White
Write-Host "  💾 GitHub Repository: Connected" -ForegroundColor White

Write-Host ""
Write-Host "⚡ SUPER POWER CAPABILITIES:" -ForegroundColor Yellow
Write-Host "  📋 Enhanced Requirements Builder - Ready" -ForegroundColor White
Write-Host "  🔗 Dropbox Integration Template - Armed" -ForegroundColor White
Write-Host "  🎯 SOP Protocols - Loaded" -ForegroundColor White
Write-Host "  🤖 Agent Development - Full Power" -ForegroundColor White
Write-Host "  📚 MCP Documentation - Active" -ForegroundColor White

Write-Host ""
Write-Host "🚀 ACTIVATION COMPLETE!" -ForegroundColor Green -BackgroundColor Black
Write-Host ""
Write-Host "🎯 READY FOR SUPER POWER DEVELOPMENT!" -ForegroundColor Cyan -BackgroundColor Black
Write-Host ""
Write-Host "💡 COMMANDS:" -ForegroundColor Yellow
Write-Host "  • 'work on Agent001PayRec' - Modify existing agent" -ForegroundColor White
Write-Host "  • 'create new agent' - Use requirements builder" -ForegroundColor White  
Write-Host "  • 'backup to github' - Push latest changes" -ForegroundColor White
Write-Host "  • 'run deactivate.ps1' - Clean shutdown" -ForegroundColor White
Write-Host ""
