-- AUTO-GENERATED: OP15-041 / 올럼버스
-- rules_id=OP15-041 script_id=880002343 fingerprint=5ba75a7a35f75fc75e911f4bdadc5f24600798a83e310954bfd9aee88d95c303
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-041]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【KO 시】카드를 1장 뽑는다.]],
        timings={
          [[ON_KO]],
        },
      },
      {
        actions={
          {
            duration=[[THIS_TURN]],
            keyword=[[RUSH]],
            op=[[GAIN_KEYWORD]],
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
            count=1,
            op=[[RETURN_OWN_CARD_TO_DECK_BOTTOM]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 캐릭터 1장을 주인의 덱 맨 아래에 놓을 수 있다: 이 캐릭터는 이번 턴 동안 【속공】을 얻는다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-041]],
    schema_version=1,
  })
end
