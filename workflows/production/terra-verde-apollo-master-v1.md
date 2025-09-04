# Terra Verde - Apollo Import + Email Campaign (MASTER)

## 🎯 Purpose
Comprehensive master workflow that handles Apollo lead imports and executes email campaigns for Terra Verde business operations.

## 🚀 Workflow Overview
This is your main production workflow that automates the complete lead-to-campaign process.

## 🔧 Components
- **Apollo Integration**: Import leads and contact data
- **Email Campaign Engine**: Automated email marketing campaigns  
- **Data Processing**: Lead qualification and segmentation
- **Notifications**: Status updates and alerts

## ⚡ Triggers
- Scheduled imports from Apollo
- Webhook triggers for real-time lead updates
- Manual campaign launches

## 📊 Data Flow
1. **Apollo Import** → Lead data extraction
2. **Data Processing** → Cleaning and validation
3. **Lead Segmentation** → Campaign targeting
4. **Email Campaign** → Automated sending
5. **Tracking & Analytics** → Performance monitoring

## 🔐 Requirements
- Apollo API credentials
- Email service credentials (SMTP/API)
- Terra Verde database access
- Webhook endpoints configured

## 📁 File Information
- **File**: `terra-verde-apollo-master-v1.json`
- **Version**: 1.0.0
- **Status**: Active Production
- **Category**: Master Workflow
- **Tags**: terra-verde, apollo, email-campaign, production

## 📝 Setup Instructions

### 1. Export from n8n
1. Go to: https://jcadvisor1956.app.n8n.cloud
2. Open your "Terra Verde - Apollo Import + Email Campaign (MASTER)" workflow
3. Click the three dots (⋯) → **Download**
4. Save the JSON file

### 2. Update Repository
1. Open the JSON file: `workflows/production/terra-verde-apollo-master-v1.json`
2. Replace the placeholder content with your actual workflow JSON
3. Save the file

### 3. Commit to GitHub
```bash
git add workflows/production/terra-verde-apollo-master-v1.*
git commit -m "Add: Terra Verde Apollo Master Workflow v1"
git push origin main
```

## 🧪 Testing Checklist
- [ ] Apollo API connection working
- [ ] Email credentials configured
- [ ] Database connections tested
- [ ] Webhook endpoints responding
- [ ] Test campaign sent successfully
- [ ] Error handling verified

## 🚨 Troubleshooting
- **Apollo API Issues**: Check rate limits and credentials
- **Email Delivery**: Verify SMTP settings and authentication
- **Database Errors**: Check connection strings and permissions
- **Webhook Failures**: Test endpoint availability

## 📈 Performance Notes
- Monitor Apollo API rate limits
- Optimize email batch sizes
- Implement proper error handling
- Set up monitoring and alerts

## 🔄 Updates & Versions
- **v1.0.0**: Initial master workflow setup

## 🎯 Success Metrics
- Lead import success rate
- Email delivery rate
- Campaign engagement metrics
- Error rate monitoring
