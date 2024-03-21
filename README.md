# Mage AI CI/CD pipeline

<a href="https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/mage-ai"><img src="deploy-on-elestio.png" alt="Deploy on Elest.io" width="180px" /></a>

Deploy Mage AI server with CI/CD on Elestio

<img src="mageai.png" style='width: 100%;'/>
<br/>
<br/>

# Once deployed ...

You can open Mage AI UI here:

    URL: https://[CI_CD_DOMAIN]
    email: [ADMIN_EMAIL]
    password: [ADMIN_PASSWORD]

# Set the log retention period

To delete old logs in your persistent volume, you can specify the `retention_period` in the `logging_config`. Valid period units are `h`, `d`, and `w`.

Example logging config:

```
logging_config
  retention_period: '15d'
```

Then you can run the command `mage clean-old-logs [project_uuid]` to clean up old logs

To accomplish this task, follow these steps: 
1. Navigate to the Elestio dashboard.
2. Go to Tools and select VS Code.
3. Open the file located inside the directory: data/default_repo/metadata.yaml.
4. Insert the above code at the end of the file.
5. Return to the dashboard overview.
6. Click on the "Restart" button.
