# coding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

class Array
  def choice
    at( rand (size) )
  end
end

# 1.upto(10) do |i|
#   Faq.create(question: "よくある質問#{i}です。よくある質問#{i}です。よくある質問#{i}です。よくある質問#{i}です。よくある質問#{i}です。よくある質問#{i}です。", answer: "よくある質問#{i}の回答#{i}です。よくある質問#{i}の回答#{i}です。よくある質問#{i}の回答#{i}です。よくある質問#{i}の回答#{i}です。よくある質問#{i}の回答#{i}です。よくある質問#{i}の回答#{i}です。よくある質問#{i}の回答#{i}です。よくある質問#{i}の回答#{i}です。よくある質問#{i}の回答#{i}です。", faq_category_id: ['1', '2', '3'].choice)
# end

1.upto(12) do |i|
  Lesson.create(
    title: "レッスン#{i}",
    summary: "Lesson#{i}の概要です。Lesson#{i}の概要です。Lesson#{i}の概要です。Lesson#{i}の概要です。Lesson#{i}の概要です。Lesson#{i}の概要です。",
    movie: "lesson#{i}の動画",
    time: "00:00:#{i}",
    grade: "1",
    category_name: "カテゴリー"+['1', '2', '3', '4', '5'].choice,
    category_summary: "カテゴリーの概要。カテゴリーの概要。カテゴリーの概要。カテゴリーの概要。",
    unit_name: "単元"+['1', '2', '3'].choice,
    unit_summary: "単元の概要。単元の概要。単元の概要。単元の概要。単元の概要。単元の概要。単元の概要。単元の概要。単元の概要。単元の概要。単元の概要。単元の概要。",
    unit_item_name: "単元項目"+['1', '2', '3', '4'].choice,
    unit_item_summary: "単元項目の概要。単元項目の概要。単元項目の概要。単元項目の概要。単元項目の概要。単元項目の概要。単元項目の概要。単元項目の概要。単元項目の概要。単元項目の概要。単元項目の概要。単元項目の概要。単元項目の概要。単元項目の概要。",
    explanation: "lesson#{i}の解説です。lesson#{i}の解説です。lesson#{i}の解説です。lesson#{i}の解説です。lesson#{i}の解説です。lesson#{i}の解説です。lesson#{i}の解説です。lesson#{i}の解説です。lesson#{i}の解説です。lesson#{i}の解説です。lesson#{i}の解説です。lesson#{i}の解説です。lesson#{i}の解説です。",
    exercise: "問1. lesson#{i}の練習問題1です。lesson#{i}の練習問題1です。lesson#{i}の練習問題1です。<br><br>問2. lesson#{i}の練習問題2です。lesson#{i}の練習問題2です。lesson#{i}の練習問題2です。lesson#{i}の練習問題2です。lesson#{i}の練習問題2です。lesson#{i}の練習問題2です。",
    exercise_answer:"問1. lesson#{i}練習問題1の回答です。lesson#{i}練習問題1の回答です。lesson#{i}練習問題1の回答です。lesson#{i}練習問題1の回答です。<br><br>問2. lesson#{i}練習問題2の回答です。lesson#{i}練習問題2の回答です。lesson#{i}練習問題2の回答です。lesson#{i}練習問題2の回答です。lesson#{i}練習問題2の回答です。lesson#{i}練習問題2の回答です。lesson#{i}練習問題2の回答です。lesson#{i}練習問題2の回答です。",
    point: "lesson#{i}のポイント！lesson#{i}のポイント！lesson#{i}のポイント！lesson#{i}のポイント！lesson#{i}のポイント！lesson#{i}のポイント！lesson#{i}のポイント！lesson#{i}のポイント！lesson#{i}のポイント！",
    number: "#{i}"
    )
end

13.upto(30) do |i|
  Lesson.create(
    title: "レッスン#{i}",
    summary: "Lesson#{i}の概要です。Lesson#{i}の概要です。Lesson#{i}の概要です。Lesson#{i}の概要です。Lesson#{i}の概要です。Lesson#{i}の概要です。",
    movie: "lesson#{i}の動画",
    time: "00:00:#{i}",
    grade: "2",
    category_name: "カテゴリー"+['1', '2', '3', '4', '5'].choice,
    category_summary: "カテゴリーの概要。カテゴリーの概要。カテゴリーの概要。カテゴリーの概要。",
    unit_name: "単元"+['1', '2', '3', '4'].choice,
    unit_summary: "単元の概要。単元の概要。単元の概要。単元の概要。単元の概要。単元の概要。単元の概要。単元の概要。単元の概要。単元の概要。単元の概要。単元の概要。",
    unit_item_name: "単元項目"+['1', '2', '3'].choice,
    unit_item_summary: "単元項目の概要。単元項目の概要。単元項目の概要。単元項目の概要。単元項目の概要。単元項目の概要。単元項目の概要。単元項目の概要。単元項目の概要。単元項目の概要。単元項目の概要。単元項目の概要。単元項目の概要。単元項目の概要。",
    explanation: "lesson#{i}の解説です。lesson#{i}の解説です。lesson#{i}の解説です。lesson#{i}の解説です。lesson#{i}の解説です。lesson#{i}の解説です。lesson#{i}の解説です。lesson#{i}の解説です。lesson#{i}の解説です。lesson#{i}の解説です。lesson#{i}の解説です。lesson#{i}の解説です。lesson#{i}の解説です。",
    exercise: "問1. lesson#{i}の練習問題1です。lesson#{i}の練習問題1です。lesson#{i}の練習問題1です。<br><br>問2. lesson#{i}の練習問題2です。lesson#{i}の練習問題2です。lesson#{i}の練習問題2です。lesson#{i}の練習問題2です。lesson#{i}の練習問題2です。lesson#{i}の練習問題2です。",
    exercise_answer:"問1. lesson#{i}練習問題1の回答です。lesson#{i}練習問題1の回答です。lesson#{i}練習問題1の回答です。lesson#{i}練習問題1の回答です。<br><br>問2. lesson#{i}練習問題2の回答です。lesson#{i}練習問題2の回答です。lesson#{i}練習問題2の回答です。lesson#{i}練習問題2の回答です。lesson#{i}練習問題2の回答です。lesson#{i}練習問題2の回答です。lesson#{i}練習問題2の回答です。lesson#{i}練習問題2の回答です。",
    point: "lesson#{i}のポイント！lesson#{i}のポイント！lesson#{i}のポイント！lesson#{i}のポイント！lesson#{i}のポイント！lesson#{i}のポイント！lesson#{i}のポイント！lesson#{i}のポイント！lesson#{i}のポイント！",
    number: "#{i}"
    )
end

31.upto(52) do |i|
  Lesson.create(
    title: "レッスン#{i}",
    summary: "Lesson#{i}の概要です。Lesson#{i}の概要です。Lesson#{i}の概要です。Lesson#{i}の概要です。Lesson#{i}の概要です。Lesson#{i}の概要です。",
    movie: "lesson#{i}の動画",
    time: "00:00:#{i}",
    grade: "3",
    category_name: "カテゴリー"+['1', '2', '3', '4', '5'].choice,
    category_summary: "カテゴリーの概要。カテゴリーの概要。カテゴリーの概要。カテゴリーの概要。",
    unit_name: "単元"+['1', '2', '3'].choice,
    unit_summary: "単元の概要。単元の概要。単元の概要。単元の概要。単元の概要。単元の概要。単元の概要。単元の概要。単元の概要。単元の概要。単元の概要。単元の概要。",
    unit_item_name: "単元項目"+['1', '2', '3', '4'].choice,
    unit_item_summary: "単元項目の概要。単元項目の概要。単元項目の概要。単元項目の概要。単元項目の概要。単元項目の概要。単元項目の概要。単元項目の概要。単元項目の概要。単元項目の概要。単元項目の概要。単元項目の概要。単元項目の概要。単元項目の概要。",
    explanation: "lesson#{i}の解説です。lesson#{i}の解説です。lesson#{i}の解説です。lesson#{i}の解説です。lesson#{i}の解説です。lesson#{i}の解説です。lesson#{i}の解説です。lesson#{i}の解説です。lesson#{i}の解説です。lesson#{i}の解説です。lesson#{i}の解説です。lesson#{i}の解説です。lesson#{i}の解説です。",
    exercise: "問1. lesson#{i}の練習問題1です。lesson#{i}の練習問題1です。lesson#{i}の練習問題1です。<br><br>問2. lesson#{i}の練習問題2です。lesson#{i}の練習問題2です。lesson#{i}の練習問題2です。lesson#{i}の練習問題2です。lesson#{i}の練習問題2です。lesson#{i}の練習問題2です。",
    exercise_answer:"問1. lesson#{i}練習問題1の回答です。lesson#{i}練習問題1の回答です。lesson#{i}練習問題1の回答です。lesson#{i}練習問題1の回答です。<br><br>問2. lesson#{i}練習問題2の回答です。lesson#{i}練習問題2の回答です。lesson#{i}練習問題2の回答です。lesson#{i}練習問題2の回答です。lesson#{i}練習問題2の回答です。lesson#{i}練習問題2の回答です。lesson#{i}練習問題2の回答です。lesson#{i}練習問題2の回答です。",
    point: "lesson#{i}のポイント！lesson#{i}のポイント！lesson#{i}のポイント！lesson#{i}のポイント！lesson#{i}のポイント！lesson#{i}のポイント！lesson#{i}のポイント！lesson#{i}のポイント！lesson#{i}のポイント！",
    number: "#{i}"
    )
end

