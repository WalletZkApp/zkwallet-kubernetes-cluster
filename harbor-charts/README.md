
```bash
helm repo add harbor https://charts.bitnami.com/bitnami

helm fetch harbor/harbor --untar

helm install harbor . -n harbor \
 --set 'adminPassword=AgCBSqq/9/6PUr0ezMQ7ElGF12z06vZCG6lNivKjoS3Rvs4+gIZCcBYPe2qCJUyAFrIe+vnp59pOL095aV9KzNcAnotMFMDQ+P1QRXDr0K2TgIlNU9G8a9OdLuiz89K/dOFo+Ll7nMDoe5dtlUtqe1wtmplbnb9agD97L/wUuWyUbnxJEvYavmgiYhfA69Cj1G8FY7Iq4ZJdm5XLGwTt1A/g20/dzLpUiitFVJHksuvtMVY+1AnqvgcgLP78Rb7r3Oerw3hbm/4Bqj2KDRSH8AZz2dKIasbTMeMHv0Lv+YC6alUMhv9QB7vszMccqm9DKPWosBWxmdORzIOm8L+pCmIAv/e6AxR/ZzfUVSs5YEsiavFMD395cd9bDcyV1XnlskcnctxK84RaTjf6FaItqQ7KzcClT+q2YD2rKvNbVPcPKFI/k0pTB3ZlvBzY9g57VJtHDjYlub8RYAOFlViL0kah7bZ0VzBq5ZEGfUpfCagUeyTiskWFkeri/5i5aYrQpz0XJoYzcCESlq8mN+W4kB33+PD/zFXOUpRMcGbBQeGUfRerSohSucmYJscKf4UYQkGJcdLZPxeYGCFjSLUm52dcWB1RvvpbiYieJNSGvuu2xRo5Uo4zOgX/rpU4P8DNL9iwU1n9RJvcCxW5jnk4vv4qBiZg40aImUVGUIg2hCmIGQmWPaS8mbTumxHx9GIsQsZqXwUdYWcnRJAczq7m1Dcwi20gTyUp9Qf+hrvsdaI='

  --set externalURL=https://core.harbor.walletzk.app
  --set ingress.core.hostname=core.harbor.walletzk.app \
  --set notary.hostname=notary.harbor.walletzk.app \
  --set nginx.tls.commonName=core.harbor.walletzk.app \
  --set registry.credentials.username=AgA9KPlWr3vJCdayM7k7+vJt3WxY1JNh1QLZVcCQfg+KQG0I0ayOmzmrnLPPSNTIQ6xPV6P37Vcxa3zMwTnv1bvFqHv19e9ghzhI9I206ZhLBrXVNrBOSzDHqQoZp/2F80g/yHeITR3zwY032sq92EvXMprGz/B7vYpE6zb8rQwUzV7IAUxDEcfSl/+FvGcZgk+IfEwE8qsWEGU70WuQ8Walkr7NAogFwBvGOFQsefSWAOcC8JOlpJjN2rKVCjx85o1cDXExclljWkQcI/Fx5gd+wHtSKW0tJmkupH0gEidILut5I5nJ8vx7sQM3BvSc2UcQ6T++ueZ0CvREU6gH2I8uy2ABVI920fE4LZIkvpW/l0pw4BiHlA1nUTlMppWDGiWEKaPKS8bC0JsxwknGnbzUuVzyvctoy1K2lGxPbRYftcdg3r9jAg70XOOqqpxVrJnd4yC3PKtc+krdC/PB370TvKe3+mp4WQudC1zVPF8Idi70A5VL5lkvZAqmkrN1HqWxoEFo7M3Y3xxZ4kVXdbPZe20ecgAkP8/ZnO6EhUnrGN3zcHllTfhw6ATomHun1Tg8Vx5zEv7d+4RWe73FVnyjnzvbsOuEwwsdtdRYcDuupXjl5jElnfurGgkqDL2kNYMFJ6UkFthVtbnW+uXDKQZyWeTQqh35ibngk3RFcVHXgcA/m9m050srPDyauwnytVt7B/GqyR/H9g== \
  --set postgresql.auth.postgresPassword=AgBCKDBEDbAuNmB0QVQPpZ9RYmzJeyjj/I4+QMEdCc3EPNVGzh1E9rg5BbBHAbGGQ6+6njq66tIc7OjXftG6bML+P0zK4xvIjQtFeuO7BQ0RpgQAsF+2ikqcesljjELXdb0H11uCnTFtQb28LK81LvFg7VuPhwp/D0AOgVh2KhCjb1rxfz9TEnD97s83zp41bGAaVGps23TuyGZl86x3uzQpma3KLMnvMClwFt0jP6Dx3PB1Gs2y1yLbuFiBmftMweGOFoOAWkH+vQ2shUgJAVmxBuwN6GWJXXmC20Q06I0NFVyjPl5bXJJ4Z/yCm+1BGD/P0eEeK4/fyfy6h67ZHeVyEKZIdFuLlshts30fA28cq4KSocPza5rX0cVtstZcU1Oqbqzt1mSk71X6uBcNpsLzt84NCwVnQ3nut3DF5ajv0EI79OV+xVuhX914yD8fZr5YWud/QHKSJXPXXuIVDTE7VLQUC/RZWv2mMLWi6bO13feAoUEjTLWUtN2V/p1GI0ut4xC7YC71Dhp8apvxHrRqz57yWzR3sJLPv9mVudG94rAs5QdGVxxUt5RTU+lNhfD3ABEWJcu1VzgXkenGyudVPRT0lH1HjUKo2bB44ZnZPBsSZvp4xEgZV0vDvTqPz4UyI3y6VP2mukECWpDZbYL/Jz0vpOJOWrUwPMYupCd67JHVbrc5D0TfRcweVQ2g7QQxL1Di1jetvAuYHWBcd73YDnWdHEalUglXRTLLuo0= \
  --set redis.auth.password=AgAzdyusHjBjRm90r1bagigqu0zVCXqhoz/sxv0EWtenmDpBOYN828+xEwnhGMp0kpolhNA5+iB4RP5n6GAFPQfQFYUpF7oF9VHx4fd6ROhh1N7mu0OxDFKszrFSgXtIDmMANOlZgVro9XtXWhezTpVe5XRSFuvgezrmvlfr1AJrXzGGkpMxBV2LbGjsW52mC96zzU25c3blfyUdZpNktJ1W5BJXxHeKsUmr4DpSIFwFz5pzxP07TWihiu65kbu6W9EK4orHNYIMou2fRTAuiilaRtya2qamGL3vWk3mV3R7L9jH7fnEaIYy/edN7OM+b45Fo9CtkckmiCivccz0NAH5F+k65Lir67IV9JW3sDcfDwJC0frxKsK3/wNeytcXsshDJQCJZ4ZaBhFT7iT96CEQo7wib7BK2WL1jAJjktnezXm418R4tZtTjhewed51eBpRMQxsdDacPGZtDkj5WUnaUa24IHUIgmEdV7j/f3KvlgArMnsLSU+PVZBS/5ak7x4Wb6vP74/IebX8uhM6/KzprjBn+Bdi+xndls6ejYKkLQfYmVTMnXSjzpupGh/8n6d6VdUGmmil+xHY/Em7mKP82dTfMS/hfj7ZXBTw3ALLKEMy5tq59CTJd2mYjqIKmp8RKK6ycJbVZV6NC/cbAPbkcBEsU+LgPqNmEGs1ODfbBzfTHEMTgyBucfE3U4rA2S0=
```