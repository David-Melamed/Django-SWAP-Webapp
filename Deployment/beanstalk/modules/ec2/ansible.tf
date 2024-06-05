resource "null_resource" "ansible_provision" {
  count = length(data.aws_instances.instances.public_ips)

  provisioner "local-exec" {
    command = "${path.module}/scripts/ansible.sh ${data.aws_instances.instances.public_ips[count.index]}"
  }

  depends_on = [data.aws_instances.instances]
}