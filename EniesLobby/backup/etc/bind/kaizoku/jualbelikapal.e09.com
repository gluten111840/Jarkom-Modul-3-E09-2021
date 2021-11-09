;
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	jualbelikapal.e09.com. root.jualbelikapal.e09.com. (
			      2021110901		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	jualbelikapal.e09.com.
@	IN	A	192.204.2.3
www	IN	CNAME	jualbelikapal.e09.com.
@	IN	AAAA	::1
