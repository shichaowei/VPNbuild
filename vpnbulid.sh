sed -i "s/#localip 192.168.0.1/localip 192.168.0.1/g" /etc/pptpd.conf;
sed -i "s/#remoteip 192.168.0.234-238,192.168.0.245/remoteip 192.168.0.234-238,192.168.0.245/g" /etc/pptpd.conf;
sed -i "s/#ms-dns 10.0.0.1/ms-dns 8.8.8.8/g" /etc/ppp/pptpd-options;
sed -i "s/#ms-dns 10.0.0.2/ms-dns 8.8.4.4/g" /etc/ppp/pptpd-options;
sed -i "/IP addresses/a dd pptpd 123456 * " /etc/ppp/chap-secrets;
sed -i "s/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g" /etc/sysctl.conf;
sysctl -p;
iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o eth0 -j MASQUERADE;
service pptpd restart;
