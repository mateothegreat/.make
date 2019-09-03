docker/build: guard-TAG

	@echo "Building an image with the current tag $(TAG).."

	docker build --rm --tag $(TAG)

docker/run: guard-TAG

	@echo "Running $(TAG) on port $(PORT).."

	docker build run -p$(PORT):$(PORT) $(TAG)


					.
