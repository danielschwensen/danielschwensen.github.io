---
layout: post
title: "Formats of SSL/TLS certificates and their usage"
date: 2021-07-29
categories: blog Security
tags: SSL TLS
---
The SSL/TLS certificates can be stored in several formats and also have different file extensions - e.g. pem, cer, der, pfx.

What is the difference among certificates that can be stored as .p7b, .pfx, .p12, .pem, .der, .crt or .cer?

The file extension of SSL certificates ar not decisive. SSL certificate can be in text format (this is the most common - it is available on Linux and Apache, Unix and other servers) or binary (Java, Microsoft Server).

In text form, the certificate is stored in Base64 in a file. After opening this document - e.g. in Notepad - you will see its content encoded in Base64 and the footer/final line BEGIN/END CERTIFICATE.

**PFX/P12/PKCS#12 format**

The PCKS#12 or PFX/P12 format represents a binary format for keeping the certificate (along with its intermediate) together with the private key. The certificates and the private key are password protected in the PFX file.

The most commonly used extension of the format is .pfx and .p12.
PKCS#12 is often used on the Windows devices for importing and exporting the certificates together with the private key.
The certificates stored in PFX are also used for signing in Microsoft Authenticode.

**PEM format**

This is the most widely used format for storing certificates. The majority of servers - e.g. Apache - work with the private key and the certificate in separate, independent files. We can often hear about the PEM certificate as the "text format" because it is encoded in Base64.
It is a format encoded in Base64 with ASCII characters.
The most commonly used extensions for these certificates are .cer, .crt, .pem or .key (for the private key).
Apache and all servers on Unix/Linux OS assume this format.

**DER format**

The DER format is a binary certificate format. It is not a text file and therefore it cannot be edited as text in Base64 (open in Notepad, copy, etc.).
All certificate types and the private key can be stored in DER.
The extension of DER certificates is usually .cer or .der.
The DER format is used on the Java platforms.

**Format P7B/PKCS#7**

The PCKS#7 or P7B format represents one or more certificates in the Base64 ASCII format stored in a file with the extension .p7b or .p7c.

The P7B file contains the certificate and its chain (the intermediate certificates), but the private key is not present in it.
The P7B files are most commonly used on the Java Tomcat platform.
