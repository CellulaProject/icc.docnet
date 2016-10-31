import os
from setuptools import setup, find_packages

here = os.path.abspath(os.path.dirname(__file__))

with open(os.path.join(here, 'README.rst')) as f:
    README = f.read()


setup(name='icc.docnet',
      version=0.1,
      description='Digital institution server',
      long_description=README,
      classifiers=[
          "Programming Language :: Python",
          "Framework :: Pyramid",
          "Topic :: Internet :: WWW/HTTP",
          "Topic :: Internet :: WWW/HTTP :: WSGI :: Application"
      ],
      keywords="web services",
      author='Evgeny Cherkashin',
      author_email='eugeneai at irnok.net',
      url='',
      packages=find_packages(),
      include_package_data=True,
      zip_safe=False,
      install_requires=[
        'setuptools',
        'icc.cellula',
        ],
      dependency_links = [
        'https://github.com/eugeneai/icc.cellula/archive/master.zip#egg=icc.celulla-0.1',
        ],
      package_dir = {'': 'src'},
      entry_points = """\
      []
      main=icc.docnet.app:main
      """,
#    message_extractors = {
#        'src/icc/cellula': [
#            ('**.py',                'python', None),
#            ('**/templates/**.pt',   'xml', None),
#        ],
#    },
)
