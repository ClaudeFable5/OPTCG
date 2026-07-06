-- AUTO-GENERATED: OP05-080 / 엘리자벨로 2세
-- rules_id=OP05-080 script_id=880000693 fingerprint=e0cd008998aaa05acf39e0ef2ac1b8ace538ebbafdce73605697a6a1ebebdb0f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-080]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_BATTLE]],
            keyword=[[DOUBLE_ATTACK]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            amount=10000,
            duration=[[THIS_BATTLE]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=20,
            filter={},
            op=[[RETURN_TRASH_TO_DECK_BOTTOM]],
            order=[[CHOOSE]],
            shuffle=true,
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【어택 시】【턴 1회】자신의 트래시에서 카드 20장을 덱으로 되돌리고 셔플할 수 있다: 이번 배틀 동안, 이 캐릭터는 【더블 어택】을 얻고, 파워 +10000.
(이 카드가 주는 대미지는 2가 된다)]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP05-080]],
    schema_version=1,
  })
end
