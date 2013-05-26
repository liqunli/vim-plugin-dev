if !has('python')
    echo "Error: Required vim compiled with +python"
    finish
endif

function! Translate()

python << EOF

from json import load 
from urllib2 import urlopen
import vim

# 获取当前位置的单词
cw = vim.current.window
row = cw.cursor[0]
col = cw.cursor[1]

if len(vim.current.buffer) == 0:
  quit()

cline = vim.current.buffer[row - 1]

separator = '" \'[]{}|=+-_()*&^%$#@!\\/\n'

begin = col
end = col

while begin > 0 and cline[begin] not in separator :
	begin -= 1

while end < len(cline) and cline[end] not in separator:
	end += 1

print '-->',cline[begin+1:end]

# 创建Query的URL, keyfrom和key需要在http://fanyi.youdao.com/openapi注册得到
# 个人开发是不需要付费的 :)
url = 'http://fanyi.youdao.com/openapi.do?keyfrom={keyfrom}&key={key}&type=data&doctype=json&version=1.1&q='

url += cline[begin+1:end]

translation = []

try:
	raw = urlopen(url)
	fields = load(raw)

	for field in fields['basic']['explains']:
		# 在调试过程中，如果不加.encode('utf-8')是无法正确用print显示中文的，
		# 但在vim的显示中，似乎直接就能处理unicode

		## translation.append('\t'+field.encode('utf-8'))
		translation.append('   '+field)
except Exception, e:
	pass

# 判断是否因为拼写错误或其它原因导致无返回结果
if len(translation) == 0:
	print "Error: network problem or spell wrong" 
else:
	for line in translation:
		print line


EOF

endfunction
