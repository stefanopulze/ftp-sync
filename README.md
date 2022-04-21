# FTP Sync
Copying file via lftp using this Github action.


## Example usage

```yaml
name: Deploy via ftp
on: push
jobs:
  deploy:
    name: Deploy
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: Upload ftp
      uses: stefanopulze/ftp-sync@main
      with:
        server: ${{ secrets.FTP_SERVER }}
        username: ${{ secrets.FTP_USERNAME }}
        password: ${{ secrets.FTP_PASSWORD }}
        localDir: "dist"
        remoteDir: "www"
```

## Input parameters

Input parameter | Description | Required | Default
--- | --- | --- | ---
server | FTP server name | Yes | N/A
username | FTP username | Yes | N/A
password | FTP password | Yes | N/A
localDir | The local directory to copy | No | .
remoteDir | The remote directory to copy to | No | .
forceSsl | Force SSL encryption | No | false
allowSsl | Allow SSL | No | 'off'
opts | Extra options for LFTP, [see manual](https://lftp.yar.ru/lftp-man.html) | No | ''

## Advanced Example usage

```yaml
name: Deploy via ftp
on: push
jobs:
  deploy:
    name: Deploy
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: Upload ftp
      uses: stefanopulze/ftp-sync@main
      with:
        server: ${{ secrets.FTP_SERVER }}
        username: ${{ secrets.FTP_USERNAME }}
        password: ${{ secrets.FTP_PASSWORD }}
        localDir: "dist"
        remoteDir: "www"
        opts: "-vv -x folder1 -x file2"
```