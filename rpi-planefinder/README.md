# rpi-planefinder

Client-side container for forwarding ADS-B data from dump1090 to PlaneFinder.
https://planefinder.net/sharing/client

It will connect to the dump1090 container and provide web interface on port 30053.

- Web-based setup for easy configuration
- Searchable and sortable tabular data view
- Auto-updating log viewer
- Live statistics and traffic visualisations
- Low CPU and memory usage
- Incredibly accurate data collection

Example:
```
docker run -t -i -p 30053:30053 \
  --link dump1090 \
  bradsjm/rpi-planefinder \
  --address=dump1090 --port=30005 \
  --sharecode=XXXXXXXXXX \
  --lat xx.xxx --lon xx.xxx \
  --data_format=1
```
