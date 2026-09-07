What is the purpose of Remote State in Terraform?

Solution:
Because Terraform state needs to be stored in a centralized and shared location instead of keeping it only on the local machine.

Remote state allows multiple team members and CI/CD pipelines to access the same Terraform state. It also provides state locking, which prevents multiple users or pipelines from modifying the infrastructure at the same time.

Main purposes:

* Centralized state storage
* Team collaboration
* State locking to prevent conflicts
* Secure state management
* Easy integration with CI/CD pipelines
* Backup and recovery of the Terraform state

In simple words:
We use remote state because Terraform's state file is the **source of truth for the infrastructure**, so it should be stored centrally, securely, and accessed by everyone who manages the infrastructure.

out requiremants in aws: s3 , dynamo db (RDS)