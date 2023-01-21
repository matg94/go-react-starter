rm -rf ./build
cd src/frontend && npm run build
cp -r build ../build
cd ..
go run .