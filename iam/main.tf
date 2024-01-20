provider "aws" {
  region = "us-east-2"
}

resource "aws_iam_user" "myUser" {
  name = "DW"
}

resource "aws_iam_policy" "customPolicy" {
  name = "GlacierEFS"

  policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "VisualEditor0",
			"Effect": "Allow",
			"Action": [
				"elasticfilesystem:DeleteAccessPoint",
				"glacier:AbortMultipartUpload",
				"elasticfilesystem:DescribeReplicationConfigurations",
				"elasticfilesystem:PutAccountPreferences",
				"elasticfilesystem:CreateFileSystem",
				"glacier:CreateVault",
				"elasticfilesystem:DeleteReplicationConfiguration",
				"elasticfilesystem:DescribeAccountPreferences",
				"elasticfilesystem:ClientWrite",
				"glacier:ListParts",
				"elasticfilesystem:CreateReplicationConfiguration",
				"glacier:DeleteVaultNotifications",
				"glacier:ListJobs",
				"glacier:InitiateMultipartUpload",
				"elasticfilesystem:PutLifecycleConfiguration",
				"glacier:PurchaseProvisionedCapacity",
				"glacier:UploadArchive",
				"elasticfilesystem:DescribeFileSystems",
				"elasticfilesystem:DeleteMountTarget",
				"elasticfilesystem:CreateAccessPoint",
				"elasticfilesystem:ModifyMountTargetSecurityGroups",
				"glacier:InitiateJob",
				"elasticfilesystem:Restore",
				"glacier:ListTagsForVault",
				"glacier:DeleteVault",
				"glacier:DeleteArchive",
				"elasticfilesystem:DescribeAccessPoints",
				"elasticfilesystem:UpdateFileSystemProtection",
				"elasticfilesystem:CreateMountTarget",
				"glacier:ListMultipartUploads",
				"glacier:SetVaultNotifications",
				"glacier:CompleteMultipartUpload",
				"glacier:UploadMultipartPart",
				"elasticfilesystem:Backup",
				"elasticfilesystem:PutBackupPolicy",
				"elasticfilesystem:ClientRootAccess",
				"glacier:ListVaults",
				"glacier:ListProvisionedCapacity",
				"elasticfilesystem:DeleteFileSystem",
				"elasticfilesystem:UpdateFileSystem"
			],
			"Resource": "*"
		}
	]
}  
EOF
}

resource "aws_iam_policy_attachment" "policyBind" {
  name       = "attachment"
  users      = [aws_iam_user.myUser.name]
  policy_arn = aws_iam_policy.customPolicy.arn
}
