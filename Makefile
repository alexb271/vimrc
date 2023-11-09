.PHONY: install

install:
	@echo "Copying configuration..."
	@cp ./vimrc ~/.vimrc
	@cp ./gvimrc ~/.gvimrc
	@echo "Installing Vundle..."
	@git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	@echo "Configuring ftplugin..."
	@mkdir -p ~/.vim/ftplugin
	@echo 'let g:ycm_enable_semantic_highlighting = 1' > ~/.vim/ftplugin/c.vim
	@echo 'let g:ycm_enable_semantic_highlighting = 1' > ~/.vim/ftplugin/cpp.vim
	@echo "Done"
