;
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	super.franky.e09.com. root.super.franky.e09.com. (
			      2021110801		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	super.franky.e09.com.
@	IN	A	192.204.3.69
www	IN	CNAME	super.franky.e09.com.
@	IN	AAAA	::1
