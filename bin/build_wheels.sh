mkdir -p wheelhouse && docker run --rm -v $(pwd)/wheelhouse:/wheelhouse quay.io/pypa/manylinux1_x86_64 bash -c 'set -ex; yum install -y openssl-devel; for PIP in /opt/python/*/bin/pip; do $PIP install numpy==1.13.3\;python_version\<\"3.7\" numpy==1.14.5\;python_version~=\"3.7.0\" numpy==1.17.3\;python_version~=\"3.8.0\" && $PIP wheel --no-deps healpy==1.14.0; done; for WHEEL in *.whl; do auditwheel repair $WHEEL; done'

