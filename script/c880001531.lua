-- AUTO-GENERATED: OP12-078 / 꼬치구이
-- rules_id=OP12-078 script_id=880001531 fingerprint=380c5704a452508986b22c68e3e9184e3fd70c5d85bba9c818c5f458f95a4573
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-078]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            amount=-3000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
            ["then"]=true,
          },
        },
        conditions={
          {
            op=[[FIELD_DON_LTE_OPPONENT]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신 필드의 두웅!!이 상대 필드의 두웅!! 수 이하인 경우, 카드를 1장 뽑는다. 그 후, 이번 턴 동안, 상대의 캐릭터 1장까지의 파워 -3000.]],
        timings={
          [[MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-078]],
    schema_version=1,
  })
end
