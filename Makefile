GENDIR_INC = ../include/
GENDIR_SRC = ../src/protocol/

PROTOC = ../sh/protoc-erl 
src=$(wildcard *.proto)
pfile=$(notdir $(src))
obj=$(patsubst %.proto,$(GENDIR_INC)/%_pb.hrl,$(pfile) )

all: $(obj)

$(GENDIR_INC)/%_pb.hrl: %.proto
	$(PROTOC) $<

clean:
	-rm $(GENDIR_INC)/pb_*.hrl $(GENDIR_SRC)/pb_*.erl

.PHONY: clean

