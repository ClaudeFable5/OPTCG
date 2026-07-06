-- AUTO-GENERATED: ST23-004 / 몽키 D. 루피
-- rules_id=ST23-004 script_id=880001978 fingerprint=9f5c7f04e9eb1c49f5e2ba90b80ec443be5c5fbed6b47076a921f39439d32191
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST23-004]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-1000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[REST_DON]],
          },
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】자신의 두웅!! 1장과 이 캐릭터를 레스트할 수 있다: 이번 턴 동안, 상대의 캐릭터 1장까지의 파워 -1000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[ST23-004]],
    schema_version=1,
  })
end
