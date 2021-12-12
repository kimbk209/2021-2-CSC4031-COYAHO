#!/bin/bash

#config yaml 파일 링크
grafana_config=''
dashboard_config='https://raw.githubusercontent.com/CSID-DGU/2021-2-CSC4031-COYAHO/main/web/dashboard.yaml'

#헬름 설치 및 레포 추가하는 부분 추가 필요

#그라파나 설치를 위한 네임스페이스 생성
echo '네임스페이스 생성'
kubectl create namespace 'monitoring'

#그라파나 설치
echo '그라파나 설치'
helm install grafana stable/grafana -f grafana-values.yaml --namespace monitoring
kubectl get svc -n monitoring
echo '그라파나의 외부 IP를 기억해주세요'
echo '그라파나의 외부 ip가 <pending> 상태일 경우, kubectl get svc -n monitoring -w를 입력해주세요.'

#대시보드 설치
echo '대시보드 설치'
kubectl apply -f $dashboard_config
echo '대시보드의 외부IP를 웹 브라우저에 입력해주세요'
echo '대시보드의 외부 ip가 <pending> 상태일 경우, kubectl get svc -w를 입력해주세요.'