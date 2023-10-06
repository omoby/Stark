CC=gcc
CFLAGS=-Wall -std=c99
PREFIX=/usr/local
BINS=aes_keyschedule des_keyschedule sm4_keyschedule

#配置make https://cloud.tencent.com/developer/ask/sof/108767148/answer/133169949
all: $(BINS)

aes_keyschedule: aes_keyschedule.c
	$(CC) -o $@ $^ $(CFLAGS)

des_keyschedule: des_keyschedule.c DES.c DES.h
	$(CC) -o $@ $^ $(CFLAGS)

sm4_keyschedule: sm4_keyschedule.c
	$(CC) -o $@ $^ $(CFLAGS)

install:
	@cp -a $(BINS) $(PREFIX)/bin/

clean:
	@-rm -f $(BINS)

.PHONY: clean install all
