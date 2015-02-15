require 'rails_helper'

describe GithubProject do
  describe '#valid_url?' do
    context 'when a valid url is given' do
      it 'matches ssl' do
        url = 'https://github.com/owner/repo'
        expect(GithubProject.new(url).valid_url?).to eq(true)
      end

      it 'matches non-ssl' do
        url = 'http://github.com/owner/repo'
        expect(GithubProject.new(url).valid_url?).to eq(true)
      end

      it 'matches non-bare domain' do
        url = 'http://www.github.com/owner/repo'
        expect(GithubProject.new(url).valid_url?).to eq(true)
      end

      it 'matches git url' do
        url = 'git@github.com:owner/repo.git'
        expect(GithubProject.new(url).valid_url?).to eq(true)
      end

      it 'matches a repo url' do
        url = 'owner/repo'
        expect(GithubProject.new(url).valid_url?).to eq(true)
      end
    end

    context 'when an invalid url is given' do
      it 'returns false' do
        url = 'gibberish'
        expect(GithubProject.new(url).valid_url?).to eq(false)
      end
    end
  end

  describe '#find' do
    it 'returns a matching Project' do
      url = 'foobar/repo'
      project = create(:project, owner: 'foobar', name: 'repo')

      expect(GithubProject.new(url).find).to eq(project)
    end
  end

  describe '#create' do
    it 'creates a new Project' do
      url = 'foobar/repo'
      project = GithubProject.new(url).create

      expect(project).to be_a(Project)
      expect(project.owner).to eq('foobar')
      expect(project.name).to eq('repo')
    end
  end
end
