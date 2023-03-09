# Podの中からoc deleteで自Podを削除するサンプル

## 環境の準備

### 作業用のプロジェクトを作成する

```
oc new-project octest
```

### Service Account `oc-ops` を作成する

```
oc create sa oc-ops
```

### Podを削除できるようにRoleを作成する

```
oc create role oc-in-pod --verb=get,list,delete --resource=pods
```

### 作成したRoleを `oc-ops` に付与する

```
oc adm policy add-role-to-user oc-in-pod --role-namespace octest -z oc-ops
```

### Service Account `oc-ops` にPodを削除する権限があることを確認する

```
oc auth can-i --as system:serviceaccount:octest:oc-ops delete pod
```

`yes` という出力があれば権限が付与されている。

## コンテナイメージの準備

### ocコマンド入りのコンテナイメージを作成する

```
./image_build.sh
```

## Podのデプロイ

```
oc apply -f ubi8oc-deployment.yaml
```

## Podに入る

```
oc rsh $(oc get pod -o name)
```

## Podの中から自Podを削除する

```
oc get pod
oc delete pod ${HOSTNAME}
```
