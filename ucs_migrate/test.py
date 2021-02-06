from ucsmsdk.ucshandle import UcsHandle

# Create a connection handle
handle = UcsHandle("r143b-ucs.rich.ciscolabs.com", "admin", "N3ptune1")

# Login to the server
handle.login()

object = handle.query_dn("org-root")

print(object)

# Logout from the server
handle.logout()