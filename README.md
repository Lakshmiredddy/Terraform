## ✅ Benefits of Infrastructure as Code (IaC)

- **Version Control**  
  Enables:
  - Change tracking
  - Code reviews
  - Collaboration using Git
  - Rollbacks and audits

- **CRUD Operations Simplified**  
  Easy to Create, Read, Update, and Delete infrastructure through code.

- **Consistency Across Environments**  
  Avoid the "works in dev, fails in prod" issue by replicating the same infra in every environment.

- **Inventory Management**  
  Easily understand what resources are in use by reading the code.

- **Cost Efficiency**  
  - Automatically shut down resources during non-business hours.
  - Schedule start/stop based on usage.

- **Dependency Management**  
  Automatically handles relationships between resources (e.g., attach an instance to a VPC or subnet).

- **Modular Approach**  
  Use reusable Terraform modules for better code structure and DRY principles.

---

## ⚙️ Installing Terraform on Windows

1. **Download Terraform:**
   - Go to [https://www.terraform.io/downloads.html](https://www.terraform.io/downloads.html)
   - Select `AMD64` version for Windows

2. **Extract & Place:**
   - Unzip the Terraform binary
   - Place it in a folder (e.g., `C:\Softwares\Terraform`)

3. **Set System Path:**
   - Go to `System Properties` → `Advanced` → `Environment Variables`
   - Under `System variables`, find `Path` → `Edit` → `Add` the Terraform folder path

4. **Verify Installation:**
   ```bash
   terraform --version
   ```

---
## 🚀 Getting Started with Terraform & AWS

1. **Create Terraform GitHub Repo**
   ```bash
   git clone <your_repo_url>
   cd terraform/
   ```

2. **Define Provider Configuration (`provider.tf`)**
   Example for AWS:
   ```hcl
   provider "aws" {
     region = "us-east-1"
   }
   ```

3. **Configure AWS CLI**
   ```bash
   aws configure
   ```

4. **Terraform Commands**
   ```bash
   terraform init            # Initialize the project
   terraform plan            # Show what will be created/changed
   terraform apply           # Apply changes
   terraform apply -auto-approve  # Apply without manual approval
   ```
  ## Terraform variables:
  To store the values we can use wherver we want. It is DRY prinicple
   
   ```
## Step 4: Variables

- Variables allow you to set default values.
- If you don't want to use default values, you can override them.

### Ways to Override Variables (Precedence Order):

1. **Command Line**
   ```bash
   terraform plan -var "sg_name=cmd_allow_all"
   ```
2. **`.tfvars` File**
   - Use a file like `variables.tfvars` to store variable values.
3. **Environment Variables**
   ```bash
   export TF_VAR_sg_name=env_allow_all
   unset TF_VAR_sg_name  # Unset to fall back to default
   ```
4. **Default Values**
5. **Prompt Input**
   - If no value is provided, Terraform will prompt for it.

## Step 5: Conditions

Use a ternary expression like this:
```hcl
condition ? "this value is true" : "this value is false"
```

## Step 6: Loops

### 1. Count-Based Loops
- Define `count` in the resource block.
- Use `count.index` to iterate over the instances.

### 2. For Loops

Use based on data structure:
- Use `count` if you have a **list**
- Use `for_each` if you have a **map or set**
- Use **dynamic block** for complex nested structures.

## Step 7: Interpolation

- Combine variables with strings using `${}` syntax:
  ```hcl
  "Security group name is ${var.sg_name}"
  ```



