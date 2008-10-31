function! LoadRope()
python << EOF
try:
    import ropevim
except ImportError, e:
    pass
EOF
endfunction

call LoadRope()
