# most fundamental Streem program

# build pipeline from stdin to stdout

streem do
  stdin | stdout
end

# actual stream processing will happen in the event loop
# that starts after all program execution.
