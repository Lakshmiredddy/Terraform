Dynamic blocks:

dynamic: here we need to mention the repeative blocks

dynamic "setting" {
    for_each = var.settings
    content {
      namespace = setting.value["namespace"]
      name = setting.value["name"]
      value = setting.value["value"]
    }
  }
}

Functions:
Terraform conatin builtin functiosn we cannot create our own functions.
bash: terraform console
max(value1,value2,value3)
min(value1,value2,value3)
length

common tags:
===============
project = "roboshop"
terraform = "true"
version = 1.1

variable tags:
==============
component = "cart"
Name= "cart"
version=1.0

merge tags:
=========
project = "roboshop"
terraform = "true"
component = "cart"
Name= "cart"
version=1.0

Data sources:
=============
variables ----> inputs
outputs -----> print the info after creating the resources

it can query the info from the provider

locals:
============
locals can have expressions,you can assign a name to it and use it wherever you require

local are like variables holding the values agianst keys,
but you can refer variables inside locals,expressions,functions....

can we override the values that given in variables?
no we can't
variables override: we can mention in variables that want to override
locals override: we can mention those variables that no need to override

variables can be overriden, locals cannot be ovveriden

state:
=======
Iaac: Declarative way of creating infra, whatever we declare Iaac tool should follow the sysntax

on which files are declaring 
.tf files ---> it contain desired or declarative  infra ----> expetation
what exsits in aws ---> actual infra ----> reality
state files ---> terraform use this file to track what is created in provider

terraform plan
=============
reads .tf ---> understand what user wants
read state file ---> empty
query the provider ---> alreday infra exsits or not

it starts create
terraform apply:

created infra
terraform plan:
reads .tf files,state file ----> matched

i deleted instance	in console manullay
reads .tf files,state file ----> matched
check provider to verify desired infra vs actual infra


when you change tf files
=======================
.tf ---> understand what user wants
state file ---> not matched

actual infra ----> user don't want route r53 records

terraform uses state files to track what is created in the provider every time.
we run terraform commands terraform check whether the desired infra is matched or not with actula infra thourht the stae file

we cannot put .state files local for this we user s3 buckets:
s3bucket:
keeping state file in local will not work in collabarative environment.
terraform doesn't understand what are the resources created by others
so it may create duplicate resources or else it will give erros

provisioners:
===========
when you create the server using terraform. we can take actions using provisioners
1.local-exec
2.remote-exec

where i am running terraform command that is local to terraform (laptop)
remote means server i created using terraform

After creating server if i do any actions in local that is local-exec
After creating server if i do any actions in remote that is remote-exec

failure behaviour:
if we get any error it agian create from the scratch so we don't want to stop we will face any error then we can use
on_failure = continue means it will not recreate

here we have 2 types of provinsers
creation time provisioners
destory time provisioners

provisioners will run during creation time. If yu want t run while destory we can use
when = destroy

remote exec:
means we need to connect to the server for this we need credinatilas. bacuse we cannot connect directly

multiple-infra-using-terraform:
===========================
dev,prod,qa,sit,uat,pre-prod

lakshmireddy.site

roboshop-dev-mongodb
roboshop-dev-redis
roboshop-dev-mysql


roboshop-UAT-mongodb
roboshop-UAT-redis
roboshop-UAT-mysql

roboshop-PROD-mongodb
roboshop-PROD-redis
roboshop-PROD-mysql
sites:
mongodb-dev.lakshmireddy.site

pros:
====
no need to duplicate the code
consitency

cons:
====
should be very cautious change done in DEV may go to prod alos by mistake
bash:
terraform init -backend-config=dev/backend.tf
terraform plan -var-file=dev/dev.tfvars
terraform apply -var-file=dev/dev.tfvars

If you want to change the environment 
terraform init -reconfigure -backend-config=prod/backend.tf
terraform plan -var-file=prod/prod.tfvars
terraform apply -var-file=prod/prod.tfvars

pros:
====
no need to duplicate the code
consitency

cons:
====
should be very cautious change done in DEV may go to prod aśḍlos by mistake