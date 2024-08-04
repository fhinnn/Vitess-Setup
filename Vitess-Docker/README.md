# Vitess-Setup-Docker

1. Run start.sh to start the vitess docker containers
2. Create alias for vitess domain in /etc/hosts file
   if you use WSL in windows add entry in C:\Windows\System32\drivers\etc\hosts and if you use linux add entry in /etc/hosts

```
	127.0.0.1	vitess
```

3. You can access vitess dashboard at http://vitess:8069
