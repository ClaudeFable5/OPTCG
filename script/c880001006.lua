-- AUTO-GENERATED: OP08-030 / 페드로
-- rules_id=OP08-030 script_id=880001006 fingerprint=d9fff001de1f016ed1d9b7243b66b585bbd4b22af0186591c9c9ec685013ef7f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-030]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[CHOOSE]],
            options={
              {
                {
                  count=1,
                  mode=[[UP_TO]],
                  op=[[REST_DON]],
                  player=[[OPPONENT]],
                },
              },
              {
                {
                  op=[[KO]],
                  selector={
                    count=1,
                    filter={
                      cost_lte=6,
                      state=[[RESTED]],
                    },
                    kind=[[CHARACTER]],
                    mode=[[UP_TO]],
                    owner=[[OPPONENT]],
                  },
                },
              },
            },
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】아래에서 하나를 선택한다.
· 상대의 두웅!!을 1장까지 레스트로 한다.
· 상대의 레스트 상태이고 코스트 6 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP08-030]],
    schema_version=1,
  })
end
