# Totem Express - Infraestrutura como Código (IaC) com Terraform

Este repositório apresenta a implementação de Infraestrutura como Código (IaC) para a aplicação [Totem Express](https://github.com/Totem-Express/software-architecture-fiap) utilizando o Terraform na AWS Cloud. O objetivo é demonstrar as melhores práticas na criação, automação e gerenciamento de recursos em nuvem, utilizando uma abordagem prática

---

## Visão Geral da Arquitetura

A arquitetura proposta utiliza Amazon EKS (Elastic Kubernetes Service) como orquestrador de containers, com recursos adicionais:

* VPC e Subnets configuradas para segmentação de rede.
* Node Groups e papéis IAM para os nós do cluster.
* Elastic Load Balancer para gerenciar o tráfego.
* Elastic Container Registry (ECR) para armazenar imagens de containers.
* Segurança com Grupos de Segurança e Internet Gateway.

O diagrama a seguir ilustra a infraestrutura proposta:

![image](https://github.com/user-attachments/assets/cefa2ee0-95b5-4fc9-bbea-db5db0e501b0)

## Grupo:

* Ana - RM356856
* Cadu Muller - RM357594
* Geovani - RM357597
* Igor Nascimento - RM356841
* João H. Luciano - RM 357595
