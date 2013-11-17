Datacenter-specific Configuration
=================================

This cookbook reads out the `datacenters` data bag and searches for information about where this node is running.

Afterwards, the DC-specific attributes are applied and optionally special cookbooks included.

Data bag format:

```json
{
    "id": "mydatacenter",
    "attributes": {
        "ntp": {
            "servers": ["ntp.mydatacenter.example"]
        }
    },
    "cookbooks": ["averyspecialcookbook"],
    "servers": ["my.host.in.mydatacenter.example", "another.host.in.that.datacenter"]
}
```

Valid (used) keys are:

* `id` - *required*, id/name of the DC.
* `attributes` - these attributes are merged with `node.override` attributes. This makes them not persist (compared to normal attributes) after a host is shifted to another DC.
* `cookbooks` - cookbooks/recipes declare here are automatically included and could add more sophisticated stuff than simply setting attributes.
* `servers` - *required*, Array of servers that are running in this DC.

The data bag item for the node's data center is searched for using the `servers` array, which lists all the physical servers in that DC. The above data bag item would be used by nodes with `fqdn` *my.host.in.mydatacenter.example* and *another.host.in.that.datacenter* **and also by all VMs running on those two hosts** (based on the `node[:virtualization][:masterserver]` attribute).

Note: Listing all the servers might sound awkward (if you have the luck and own 100s of boxes). In our case, it's only a
hand full and furthermore I have no clue at all, how I could search for that by declaring IP ranges in the data bag items.

