IMPL=com/dongxiguo/continuation

all release.zip: haxelib.xml haxedoc.xml LICENSE $(IMPL)/Continuation.hx

release.zip:
	 zip -u $@ $^

clean:
	$(RM) -r bin release.zip haxedoc.xml

test: bin/TestContinuation.n bin/TestContinuation.swf bin/TestContinuation.js \
		bin/TestForkJoin_java bin/TestForkJoin_cs bin/TestForkJoin.swf bin/TestForkJoin.js \
		bin/Sample.swf bin/Sample.js bin/Sample_cs bin/Sample_java \
		bin/TestNode.js

bin/TestForkJoin_cs: $(IMPL)/Continuation.hx $(IMPL)/utils/ForkJoin.hx tests/TestForkJoin.hx bin
	haxe -cs $@ -main tests.TestForkJoin

bin/TestForkJoin_java: $(IMPL)/Continuation.hx $(IMPL)/utils/ForkJoin.hx tests/TestForkJoin.hx bin
	haxe -java $@ -main tests.TestForkJoin

bin/TestForkJoin.swf: $(IMPL)/Continuation.hx $(IMPL)/utils/ForkJoin.hx tests/TestForkJoin.hx bin
	haxe -swf $@ -main tests.TestForkJoin

bin/TestForkJoin.js: $(IMPL)/Continuation.hx $(IMPL)/utils/ForkJoin.hx tests/TestForkJoin.hx bin
	haxe -js $@ -main tests.TestForkJoin

bin/TestContinuation.n: $(IMPL)/Continuation.hx tests/TestContinuation.hx bin
	haxe -neko $@ -main tests.TestContinuation

bin/TestContinuation.swf: $(IMPL)/Continuation.hx tests/TestContinuation.hx bin
	haxe -swf $@ -main tests.TestContinuation

bin/TestContinuation.js: $(IMPL)/Continuation.hx tests/TestContinuation.hx bin
	haxe -js $@ -main tests.TestContinuation

bin/TestNode.js: $(IMPL)/Continuation.hx tests/TestNode.hx bin
	haxe -js $@ -main tests.TestNode -lib hxnodejs

bin/Sample_java: $(IMPL)/Continuation.hx tests/Sample.hx bin
	$(RM) -r $@
	haxe -java $@ -main tests.Sample

bin/Sample_cs: $(IMPL)/Continuation.hx tests/Sample.hx bin
	$(RM) -r $@
	haxe -cs $@ -main tests.Sample

bin/Sample.swf: $(IMPL)/Continuation.hx tests/Sample.hx bin
	haxe -swf $@ -main tests.Sample

bin/Sample.js: $(IMPL)/Continuation.hx tests/Sample.hx bin
	haxe -js $@ -main tests.Sample

haxedoc.xml: $(IMPL)/Continuation.hx $(IMPL)/utils/ForkJoin.hx
	haxe -xml $@ $^

bin:
	mkdir $@

.PHONY: all clean test
