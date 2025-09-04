# Workflow GitHub Process - Training Guide

## 🔄 The Complete Workflow Process

### Step 1: Ask Claude to Build Workflow
1. **Ask Claude Desktop**: *"Build me a workflow for [your specific need]"*
2. **Claude creates**: Complete n8n workflow JSON
3. **You get**: Ready-to-use workflow file

### Step 2: Import to n8n (Test & Use)
1. **Copy the JSON** that Claude provides
2. **Open your n8n instance** (https://jcadvisor1956.app.n8n.cloud)
3. **Click "Import from clipboard"**
4. **Paste the JSON**
5. **Configure credentials** if needed
6. **Test the workflow**
7. **Activate when ready**

### Step 3: Save to GitHub Repository
1. **Create a new file** in your local repository
2. **Name it properly** (see naming convention below)
3. **Save the JSON** to the file
4. **Add documentation** 
5. **Commit and push** to GitHub

## 📁 File Organization Structure

```
workflows/
├── production/         # Live, working workflows
│   ├── email-automation.json
│   ├── terra-verde-apollo.json
│   └── slack-notifications.json
├── development/        # Workflows being developed
├── archived/          # Old or deprecated workflows
└── templates/         # Reusable components
```

## 📝 Naming Convention

**Format**: `category-purpose-version.json`

**Examples**:
- `email-notification-v1.json`
- `terra-verde-apollo-tracking-v2.json`
- `database-sync-customer-data-v1.json`
- `slack-alert-system-v1.json`

## 🔧 Step-by-Step Commands

### Create New Workflow File:
```bash
# Navigate to your repository
cd "C:\Users\physi\OneDrive\Desktop\my-n8n-workflows"

# Create the workflow file
New-Item -Path "workflows\production\your-workflow-name.json" -ItemType File

# Open in notepad to paste JSON
notepad "workflows\production\your-workflow-name.json"
```

### Add to GitHub:
```bash
# Add the new file
git add "workflows\production\your-workflow-name.json"

# Commit with descriptive message
git commit -m "Add: Terra Verde Apollo tracking workflow v1"

# Push to GitHub
git push origin main
```

## 📋 Complete Workflow Documentation Template

For each workflow, create a matching `.md` file:

**Example**: If you have `terra-verde-apollo-v1.json`, also create `terra-verde-apollo-v1.md`

```markdown
# Terra Verde Apollo Tracking Workflow

## Purpose
Track leads and customer data from Apollo to Terra Verde systems.

## Trigger
- Webhook from Apollo when new lead is created
- Runs every 15 minutes for batch processing

## Requirements
- Apollo API credentials
- Terra Verde database access
- Slack webhook for notifications

## Inputs
- Lead data from Apollo
- Contact information
- Tracking preferences

## Outputs
- Updated Terra Verde database
- Slack notification to sales team
- CSV file for reporting

## Setup Instructions
1. Configure Apollo webhook URL
2. Set up Terra Verde database connection
3. Add Slack webhook URL
4. Test with sample data

## Troubleshooting
- Check API rate limits
- Verify webhook endpoint
- Monitor error logs in n8n
```

## 🚀 Quick Reference Commands

**Most Common Workflow:**
1. Ask Claude for workflow
2. Copy JSON from Claude
3. Import to n8n and test
4. Save to local file: `notepad workflows\production\new-workflow.json`
5. Git commands:
   ```bash
   git add .
   git commit -m "Add: [workflow description]"
   git push
   ```

## 🎯 Benefits of This Process

✅ **Version Control** - Track all workflow changes  
✅ **Backup** - Never lose workflows  
✅ **Documentation** - Searchable workflow library  
✅ **Sharing** - Easy to share workflows with team  
✅ **Claude Integration** - Claude can see and improve workflows  
✅ **Organization** - Structured workflow management  

## 📞 When You Need Help

Ask me to help with:
- Creating the JSON file
- Writing documentation
- Git commands
- Organizing workflows
- Troubleshooting
