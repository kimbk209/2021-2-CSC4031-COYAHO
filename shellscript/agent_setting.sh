#!/bin/bash

#모니터링 할 클러스터를 위한 쉘스크립트

prometheus_config='https://raw.githubusercontent.com/CSID-DGU/2021-2-CSC4031-COYAHO/test/configuration_files/prometheus-values.yaml'
flask_api_config='https://raw.githubusercontent.com/CSID-DGU/2021-2-CSC4031-COYAHO/test/API/flask.yaml'

#헬름 설치 및 레포 추가하는 부분 추가 필요

#프로메테우스 설치를 위한 네임스페이스 생성
kubectl create namespace 'monitoring'

#프로메테우스 설치
echo '프로메테우스 설치'
helm install prometheus prometheus-community/prometheus -f $prometheus_config --namespace monitoring

#api 설치
echo 'coyaho api 설치'
kubectl apply -f flask.yaml