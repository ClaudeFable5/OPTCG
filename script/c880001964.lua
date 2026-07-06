-- AUTO-GENERATED: ST22-007 / 스쿼드
-- rules_id=ST22-007 script_id=880001964 fingerprint=b4786361aab291681755da00b882a50bd0e13a71dee3ead1c10332601fa2b6a9
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST22-007]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              trait_contains=[[흰 수염 해적단]],
            },
            on_match={
              {
                count=1,
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
            op=[[REVEAL_DECK_TOP]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 덱 위에서 1장을 공개하고, 그 카드가 『흰 수염 해적단』을 포함한 특징을 가진 경우, 자신의 리더 또는 캐릭터 1장에게 레스트 상태인 두웅!!을 1장까지 부여한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[ST22-007]],
    schema_version=1,
  })
end
