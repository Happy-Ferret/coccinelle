@@
identifier f, p_dev, link;
@@

// transformation.ml doesn't allow transforming inside a parameter when
// there are ...s, so have to hope for the best
f(struct pcmcia_device *
-                       p_dev
+                       link
   ) {
  ...
- dev_link_t *link = dev_to_instance(p_dev);
  <...
- p_dev
+ link
  ...>
}

@@
identifier link, f, handle;
expression E1, E2;
@@

f(...,dev_link_t *link,...) {
  ...
  client_handle_t handle = link->handle;
  <...
- first_tuple(handle,E1,E2)
+ first_tuple(link,E1,E2)
  ...>
}

@@
identifier link, f, handle;
expression E1;
@@

f(...,dev_link_t *link,...) {
  ...
  client_handle_t handle = link->handle;
  <...
- pcmcia_request_io(handle,E1)
+ pcmcia_request_io(link,E1)
  ...>
}

@@
identifier link, f, handle;
expression E1;
@@

f(...,dev_link_t *link,...) {
  ...
  client_handle_t handle = link->handle;
  <...
- pcmcia_request_irq(handle,E1)
+ pcmcia_request_irq(link,E1)
  ...>
}

@@
identifier link, f, handle;
expression E1;
@@

f(...,dev_link_t *link,...) {
  ...
  client_handle_t handle = link->handle;
  <...
- pcmcia_request_configuration(handle,E1)
+ pcmcia_request_configuration(link,E1)
  ...>
}

@@
identifier link, f, handle;
@@

f(...,dev_link_t *link,...) {
  ...
  client_handle_t handle = link->handle;
  <...
- pcmcia_disable_device(handle)
+ pcmcia_disable_device(link)
  ...>
}

@@
identifier link, f, handle;
expression E1;
@@

f(...,dev_link_t *link,...) {
  ...
  client_handle_t handle = link->handle;
  <...
- pcmcia_get_first_tuple(handle,E1)
+ pcmcia_get_first_tuple(link,E1)
  ...>
}

@@
identifier link, f, handle;
expression E1;
@@

f(...,dev_link_t *link,...) {
  ...
  client_handle_t handle = link->handle;
  <...
- pcmcia_get_next_tuple(handle,E1)
+ pcmcia_get_next_tuple(link,E1)
  ...>
}

@@
identifier link, f, handle;
expression E1;
@@

f(...,dev_link_t *link,...) {
  ...
  client_handle_t handle = link->handle;
  <...
- pcmcia_get_tuple_data(handle,E1)
+ pcmcia_get_tuple_data(link,E1)
  ...>
}

@@
identifier link, f, handle;
expression E1, E2;
@@

f(...,dev_link_t *link,...) {
  ...
  client_handle_t handle = link->handle;
  <...
- pcmcia_parse_tuple(handle,E1,E2)
+ pcmcia_parse_tuple(link,E1,E2)
  ...>
}

@@
identifier link, f, handle;
expression E1, E2;
@@

f(...,dev_link_t *link,...) {
  ...
  client_handle_t handle = link->handle;
  <...
- cs_error(handle,E1,E2)
+ cs_error(link,E1,E2)
  ...>
}

@@
identifier link, f, handle;
@@

f(...,dev_link_t *link,...) {
  ...
  client_handle_t handle = link->handle;
  <...
- handle_to_dev(handle)
+ handle_to_dev(link)
  ...>
}


@@
identifier link, f, handle;
@@

f(...,dev_link_t *link,...) {
  ...
- client_handle_t handle = link->handle;
  ... when != handle
}

@@
dev_link_t *link;
expression E1, E2;
@@

- first_tuple(link->handle,E1,E2)
+ first_tuple(link,E1,E2)

@@
dev_link_t *link;
expression E1;
@@

- pcmcia_request_io(link->handle,E1)
+ pcmcia_request_io(link,E1)

@@
dev_link_t *link;
expression E1;
@@

- pcmcia_request_irq(link->handle,E1)
+ pcmcia_request_irq(link,E1)

@@
dev_link_t *link;
expression E1;
@@

- pcmcia_request_configuration(link->handle,E1)
+ pcmcia_request_configuration(link,E1)

@@
dev_link_t *link;
expression E1, E2;
@@

- pcmcia_request_window(&link->handle,E1,E2)
+ pcmcia_request_window(&link,E1,E2)

@@
dev_link_t *link;
@@

- pcmcia_disable_device(link->handle)
+ pcmcia_disable_device(link)

@@
dev_link_t *link;
expression E1;
@@

- pcmcia_get_first_tuple(link->handle,E1)
+ pcmcia_get_first_tuple(link,E1)

@@
dev_link_t *link;
expression E1;
@@

- pcmcia_get_next_tuple(link->handle,E1)
+ pcmcia_get_next_tuple(link,E1)

@@
dev_link_t *link;
expression E1;
@@

- pcmcia_get_tuple_data(link->handle,E1)
+ pcmcia_get_tuple_data(link,E1)

@@
dev_link_t *link;
expression E1, E2;
@@

- pcmcia_parse_tuple(link->handle,E1,E2)
+ pcmcia_parse_tuple(link,E1,E2)

@@
dev_link_t *link;
expression E1, E2;
@@

- cs_error(link->handle,E1,E2)
+ cs_error(link,E1,E2)

@@
dev_link_t *link;
@@

- handle_to_dev(link->handle)
+ handle_to_dev(link)

@@
@@

- dev_link_t
+ struct pcmcia_device

@@
//typedef client_handle_t;
@@

- client_handle_t
+ struct pcmcia_device *