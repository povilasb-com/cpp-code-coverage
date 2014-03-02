BUILD_DIR = build
COVERAGE_REPORT_DIR = $(BUILD_DIR)/coverage-report


all: test test-run coverage


test: $(BUILD_DIR)
	cd $(BUILD_DIR); cmake $(CURDIR); make


test-run:
	$(BUILD_DIR)/lib1_test


coverage:
	lcov --capture --directory $(BUILD_DIR) \
		--output-file $(BUILD_DIR)/coverage.info
	genhtml $(BUILD_DIR)/coverage.info \
		--output-directory $(COVERAGE_REPORT_DIR)


$(BUILD_DIR):
	mkdir -p $@


clean:
	rm -rf $(BUILD_DIR)


.PHONY: all cmake clean test test-run coverage
