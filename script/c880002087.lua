-- AUTO-GENERATED: ST17-005 / 마샬 D. 티치
-- rules_id=ST17-005 script_id=880002087 fingerprint=c9c0893cc61bd294a1698ff9c65e70cf944b38746a9a50213eb93ebf10a71135
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST17-005]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            mode=[[UP_TO]],
            op=[[GIVE_DON]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            state=[[RESTED]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            filter={},
            op=[[RETURN_HAND_TO_DECK]],
            order=[[CHOOSE]],
            positions={
              [[DECK_TOP]],
            },
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 패 1장을 덱 맨 위로 되돌릴 수 있다: 자신의 리더 또는 캐릭터 1장에게 레스트 상태인 두웅!!을 2장까지 부여한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[ST17-005]],
    schema_version=1,
  })
end
