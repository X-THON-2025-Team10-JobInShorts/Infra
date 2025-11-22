# Xthon Infrastructure & Configuration
[![Terraform](https://img.shields.io/badge/terraform-844FBA.svg?style=for-the-badge&logo=terraform&logoColor=white)](https://developer.hashicorp.com/terraform)
[![Ansible](https://img.shields.io/badge/ansible-EE0000.svg?style=for-the-badge&logo=ansible&logoColor=white)](https://www.redhat.com/ko/topics/automation/learning-ansible-tutorial)
[![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)](https://aws.amazon.com/)

이 프로젝트는 AWS 클라우드 인프라를 관리하기 위한 **Terraform** 코드와, 해당 인프라 위에서 Kubernetes 환경을 구성하기 위한 **Ansible** 코드로 구성되어 있습니다.

## 📂 디렉토리 구조

```
Infra/
├── Terraform/          # Terraform 코드
│   ├── ec2_instance/   # EC2 인스턴스 (Backend, AI 노드 등)
│   ├── vpc/            # VPC 및 네트워크 설정
│   ├── sg/             # Security Groups (보안 그룹)
│   ├── iam/            # IAM User, Role, Policy
│   ├── s3/             # S3 버킷
│   └── sqs/            # SQS 큐
├── Ansible/            # 서버 설정을 위한 Ansible Playbook
│   ├── hosts.ini       # 인벤토리 파일
│   └── playbook.yml    # k3s 설치 및 설정 플레이북
└── README.md           # 프로젝트 설명서
```

---

## 1. Terraform (Infrastructure)

AWS 리소스를 관리합니다. 보안을 위해 민감한 정보(ID, IP, ARN 등)는 모두 변수(`var.*`)로 처리되어 있습니다.

### 사용 방법

1. **모듈 이동**: 작업하려는 리소스의 디렉토리로 이동합니다.
   ```bash
   cd generated/aws/ec2_instance  # 예시
   ```

2. **변수 설정**:
   - 변수로 지정할 `terraform.tfvars` 파일을 생성합니다.
   ```bash
   vi terraform.tfvars
   ```

3. **Terraform 실행**:
   ```bash
   terraform init      # 초기화
   terraform plan      # 변경 사항 확인
   terraform apply     # 리소스 생성/수정
   ```

### 주의 사항
- `.terraform` 폴더와 `terraform.tfstate` 파일은 로컬 상태를 저장하므로 공유 시 주의가 필요합니다. (이 프로젝트에서는 구조 공유를 위해 민감 정보가 제거된 상태입니다.)

---

## 2. Ansible (Configuration)

프로비저닝된 EC2 인스턴스에 Kubernetes 클러스터를 자동으로 구축합니다.

### 사용 방법

1. **인벤토리 설정**:
   - `Ansible/hosts.ini` 파일을 엽니다.
   - `[master]`와 `[worker]` 그룹에 대상 서버의 **Public IP**를 입력합니다.
   - SSH 접속을 위한 키 파일 경로(`ansible_ssh_private_key_file`)를 본인의 키 경로로 수정합니다.

   ```ini
   [master]
   master-node ansible_host=1.2.3.4 ansible_user=ubuntu ansible_ssh_private_key_file=./my-key.pem

   [worker]
   worker-node-1 ansible_host=5.6.7.8 ansible_user=ubuntu ansible_ssh_private_key_file=./my-key.pem
   ```

2. **Playbook 실행**:
   ```bash
   cd Ansible
   ansible-playbook -i hosts.ini playbook.yml
   ```

### 주요 작업 내용
- **공통**: Swap 비활성화, apt 캐시 업데이트
- **Master**: 쿠버네티스 Master 설치, 토큰 생성, kubectl 설정
- **Worker**: 쿠버네티스 Agent 설치 및 Master 노드에 조인, 노드 라벨링 (`node-role.kubernetes.io/ai-worker`)

---

## 요구 사항 (Prerequisites)

- **Terraform**: v1.0 이상
- **Ansible**: 최신 버전 권장
- **AWS CLI**: 자격 증명 설정

---

## 3. Architecture
<img width="3248" height="2404" alt="아키텍처 drawio" src="https://github.com/user-attachments/assets/7588ffb6-87d6-41c9-add9-1c98e1431b0a" />
